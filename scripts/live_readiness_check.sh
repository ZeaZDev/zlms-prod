#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/4] Checking ASP.NET runtime production flags..."
if rg -n '<compilation debug="true"' app/Web.config >/dev/null; then
  echo "FAIL: app/Web.config still has debug=\"true\""
  exit 1
fi
if rg -n '<compilation debug="false"' app/Web.config >/dev/null; then
  echo "PASS: app/Web.config has debug=\"false\""
else
  echo "WARN: Could not confirm debug flag explicitly set to false"
fi
if rg -n '<customErrors[^>]*mode="Off"' app/Web.config >/dev/null; then
  echo "FAIL: app/Web.config has customErrors mode=\"Off\""
  exit 1
fi
if rg -n '<customErrors[^>]*mode="On"' app/Web.config >/dev/null; then
  echo "PASS: app/Web.config has customErrors mode=\"On\""
else
  echo "WARN: customErrors mode is not explicitly On"
fi

echo "[2/4] Checking release transform presence..."
if [[ -f app/Web.Release.config ]]; then
  echo "PASS: app/Web.Release.config exists"
else
  echo "FAIL: app/Web.Release.config missing"
  exit 1
fi

echo "[3/4] Checking for known critical typo patterns in first-party files..."
python3 - <<'PY'
import os,re,sys
exclude_prefixes=[
'./.git','./db','./app/phpMyAdmin','./app/assets','./app/obj','./app/bin','./app/web','./app/ui__',
'./app/Upload','./app/Questionpic','./app/Questionpic - Copy','./app/knowledge','./app/knowledge_old',
'./app/knowledge_crash','./app/courseware','./app/examdb'
]
exts={'.cs','.aspx','.master','.config','.md','.txt','.html','.htm','.js','.css','.csproj'}
patterns=['occured','recieve','seperate','untill','sucess','adress','calender','langauge','paramter','retreive','publically','begining','comming','definately','enviroment','acheive','accomodate','immediatly','permision','authentification','statment','teh','flase','ture']
regex=re.compile(r'\\b('+'|'.join(patterns)+r')\\b',re.I)
found=[]
for dp,dns,fns in os.walk('.'):
    if any(dp.startswith(p) for p in exclude_prefixes):
        dns[:] = []
        continue
    for fn in fns:
        p=os.path.join(dp,fn)
        if any(p.startswith(pref) for pref in exclude_prefixes):
            continue
        if os.path.splitext(fn)[1].lower() not in exts:
            continue
        try:t=open(p,encoding='utf-8',errors='ignore').read()
        except:continue
        for m in regex.finditer(t):
            line=t.count('\n',0,m.start())+1
            found.append((p[2:],line,m.group(0)))
if found:
    print('FAIL: typo scan found issues:')
    for p,l,w in found[:50]:
        print(f'  {p}:{l}:{w}')
    if len(found)>50:
        print(f'  ... and {len(found)-50} more')
    sys.exit(1)
print('PASS: no known typo patterns found in first-party scoped files')
PY

echo "[4/4] Checking git working tree includes only intentional files..."
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git status --short
else
  echo "WARN: not running inside a git work tree; skipping git status check"
fi

echo "Live readiness checks completed."
