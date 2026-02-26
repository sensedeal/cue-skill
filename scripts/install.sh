#!/bin/bash
# Cue Skill 全新安装脚本 - 检测已有配置

set -e
echo "🔄 开始安装 Cue Skill..."

CUE_DIR="$HOME/.cuecue"

# 检测已有配置
if [ -f "$CUE_DIR/.env.secure" ]; then
    echo "📋 检测到已有配置，将自动保留"
fi

# 创建目录
mkdir -p "$HOME/.openclaw/skills"
cd "$HOME/.openclaw/skills"

# 克隆
git clone https://github.com/sensedeal/cue-skill.git cue
cd cue
npm install

echo ""
echo "✅ 安装完成!"
echo ""
echo "下一步："
echo "1. 重启 OpenClaw: openclaw restart"
echo "2. 如需配置 API Key: /key"
