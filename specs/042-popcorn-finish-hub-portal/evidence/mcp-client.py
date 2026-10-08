"""Serialized client for the project's existing official local Unreal MCP."""
import argparse
import json
import pathlib
import urllib.request

parser = argparse.ArgumentParser()
parser.add_argument("request", help="JSON-RPC request JSON file")
parser.add_argument("--output")
parser.add_argument("--timeout", type=int, default=60)
args = parser.parse_args()
headers = {"Content-Type": "application/json", "Accept": "application/json, text/event-stream"}

def rpc(body):
    req = urllib.request.Request("http://127.0.0.1:8000/mcp", json.dumps(body).encode(), headers)
    with urllib.request.urlopen(req, timeout=args.timeout) as response:
        sid = response.headers.get("Mcp-Session-Id")
        if sid:
            headers["Mcp-Session-Id"] = sid
        raw = response.read().decode()
    if not raw.strip():
        return None
    if raw.lstrip().startswith("data:") or "event:" in raw[:100]:
        items = [json.loads(line[5:].strip()) for line in raw.splitlines() if line.startswith("data:")]
        return items[-1] if items else None
    return json.loads(raw)

rpc({"jsonrpc": "2.0", "id": 1, "method": "initialize", "params": {"protocolVersion": "2024-11-05", "capabilities": {}, "clientInfo": {"name": "codex-feature041", "version": "1.0"}}})
rpc({"jsonrpc": "2.0", "method": "notifications/initialized"})
request = json.loads(pathlib.Path(args.request).read_text(encoding="utf-8-sig"))
result = rpc(request)
serialized = json.dumps(result, ensure_ascii=False, indent=2)
if args.output:
    pathlib.Path(args.output).write_text(serialized, encoding="utf-8")
print(serialized)
