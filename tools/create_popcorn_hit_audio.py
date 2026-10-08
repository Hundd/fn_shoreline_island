"""Create an original procedural pop; no imported samples or auditions.

The deterministic PCM is authored from damped chirp/noise equations here.
Source and WAV are retained so project-owned audio provenance is inspectable.
"""
import hashlib
import json
import math
from pathlib import Path
import random
import struct
import wave

root = Path(__file__).resolve().parents[1]
output = root / 'Resources/Audio/popcorn_hit_original.wav'
output.parent.mkdir(parents=True, exist_ok=True)
rate = 48000
duration = 0.175
rng = random.Random(41008)
samples = []
previous_noise = 0.0
for index in range(round(rate * duration)):
    t = index / rate
    attack = min(1.0, t / 0.002)
    tail = min(1.0, (duration - t) / 0.020)
    envelope = attack * tail * math.exp(-t * 34.0)
    # Downward chirp with a short, low-pass noise puff; all values synthesized.
    phase = 2.0 * math.pi * (1150.0 * t - 2600.0 * t * t)
    previous_noise = 0.7 * previous_noise + 0.3 * rng.uniform(-1.0, 1.0)
    sample = envelope * (0.75 * math.sin(phase) + 0.25 * previous_noise)
    samples.append(sample)
peak = max(abs(sample) for sample in samples)
pcm = b''.join(struct.pack('<h', round(sample / peak * 0.55 * 32767)) for sample in samples)
with wave.open(str(output), 'wb') as audio:
    audio.setnchannels(1)
    audio.setsampwidth(2)
    audio.setframerate(rate)
    audio.writeframes(pcm)
record = {
    'source': 'tools/create_popcorn_hit_audio.py',
    'wav_source': 'Resources/Audio/popcorn_hit_original.wav',
    'authorship': 'Original procedural waveform synthesized locally from math and deterministic PRNG; no existing sound/sample copied, transformed or embedded.',
    'sample_rate': rate, 'channels': 1, 'pcm_bits': 16,
    'frame_count': len(samples), 'duration_seconds': duration,
    'sha256': hashlib.sha256(output.read_bytes()).hexdigest(),
    'intended_asset': '/fn_shoreline_island/Audio/popcorn_hit_original.popcorn_hit_original',
    'audition_performed': False,
}
(root / 'specs/041-popcorn-feedback-and-learning/evidence/original-pop-audio-provenance.json').write_text(json.dumps(record, indent=2), encoding='utf-8')
print(json.dumps(record, indent=2))
