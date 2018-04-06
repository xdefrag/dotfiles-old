import json, sys, io
print(json.dumps(json.loads(io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8-sig').read()), separators=(',',':')))
