#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
APP_ROOT="$ROOT/EasyNovelAssistantProject"
VENV="$ROOT/venv-enamac"

# sample はリポ外。アプリ直下に配置
mkdir -p "$APP_ROOT/sample"

curl -fsSL -o "$APP_ROOT/sample/special.json"  https://yyy.wpx.jp/EasyNovelAssistant/sample/special.json
curl -fsSL -o "$APP_ROOT/sample/template.json" https://yyy.wpx.jp/EasyNovelAssistant/sample/template.json
curl -fsSL -o "$APP_ROOT/sample/sample.json"   https://yyy.wpx.jp/EasyNovelAssistant/sample/sample.json
curl -fsSL -o "$APP_ROOT/sample/nsfw.json"     https://yyy.wpx.jp/EasyNovelAssistant/sample/nsfw.json
curl -fsSL -o "$APP_ROOT/sample/speech.json"   https://yyy.wpx.jp/EasyNovelAssistant/sample/speech.json

# venv 有効化
source "$VENV/bin/activate"
export TK_SILENCE_DEPRECATION=1
export PYTHONPATH="$ROOT/shims:${PYTHONPATH:-}"

# ← ここが重要：作業ディレクトリをアプリの外側ルートに
cd "$APP_ROOT"

# ここから相対パスが正しく解決される
python EasyNovelAssistant/src/easy_novel_assistant.py