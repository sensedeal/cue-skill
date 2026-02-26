#!/bin/bash
# Cue Skill 全新安装脚本

set -e
mkdir -p "$HOME/.openclaw/skills"
cd "$HOME/.openclaw/skills"
git clone https://github.com/sensedeal/cue-skill.git cue
cd cue && npm install

echo "✅ 安装完成! 重启 OpenClaw 后生效"
