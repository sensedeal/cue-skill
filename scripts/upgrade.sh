#!/bin/bash
# Cue Skill 升级脚本

set -e
echo "🔄 开始升级 Cue Skill..."

# 备份
if [ -d "$HOME/.cuecue" ]; then
    cp -r "$HOME/.cuecue" "$HOME/.cuecue.backup.$(date +%Y%m%d)"
    echo "✅ 备份完成"
fi

# 删除旧版
rm -rf "$HOME/.openclaw/skills/cue"
rm -rf "$HOME/.openclaw/skills/cue-v1.0.4"
rm -rf "$HOME/.openclaw/skills/cuecue-gateway"

# 安装新版
cd "$HOME/.openclaw/skills"
git clone https://github.com/sensedeal/cue-skill.git cue
cd cue && npm install

echo "✅ 升级完成! 重启 OpenClaw 后生效"
