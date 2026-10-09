import json
import re
import sys
from pathlib import Path

log = Path.home() / 'AppData/Local/UnrealEditorFortnite/Saved/Logs/UnrealEditorFortnite.log'
with log.open('rb') as stream:
    stream.seek(0, 2)
    stream.seek(max(0, stream.tell() - 12000000))
    text = stream.read().decode('utf-8', errors='replace')
errors = []
for line in text.splitlines():
    match = re.search(r'^\[([^]]+)\].*UEFNValidation: Error: (campus\S+).*illegally references: (\S+)', line)
    if match:
        errors.append({'timestamp': match[1], 'label': match[2], 'asset': match[3]})
latest_minute = errors[-1]['timestamp'][:16] if errors else None
latest = [item for item in errors if item['timestamp'][:16] == latest_minute]
result = {'source': str(log), 'latest_error_minute': latest_minute, 'unique_actor_count': len({x['label'] for x in latest}), 'errors': latest}
target = Path(sys.argv[1])
target.write_text(json.dumps(result, indent=2), encoding='utf-8')
print(json.dumps({'file': str(target), 'latest_error_minute': latest_minute, 'unique_actor_count': result['unique_actor_count']}))
