#!/bin/bash
# Cue Skill 全新安装脚本 - v1.0.7

set -e
echo "🔄 开始安装 Cue Skill v1.0.7..."

CUE_DIR="$HOME/.cuecue"

# 检测已有配置
if [ -f "$CUE_DIR/.env.secure" ]; then
    echo "📋 检测到已有配置，将自动保留"
fi

# 创建目录
mkdir -p "$HOME/.openclaw/workspace/skills"
cd "$HOME/.openclaw/workspace/skills"

# 克隆
git clone https://github.com/sensedeal/cue-skill.git cue
cd cue
npm install

echo ""
echo "✅ 安装完成!"
echo ""
echo "📌 注意："
echo "- API Key 通过系统环境变量或 OpenClaw Secrets 管理"
echo "- 不提供投资建议，只提供客观分析"
echo ""
echo "下一步："
echo "1. 重启 OpenClaw: openclaw restart"
echo "2. 如需配置 API Key 请参考文档"
