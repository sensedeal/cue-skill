#!/bin/bash
# Cue Skill 升级脚本 - 保留配置 - v1.0.7

set -e
echo "🔄 开始升级 Cue Skill v1.0.7..."

CUE_DIR="$HOME/.cuecue"

# 1. 备份当前配置（保留！）
if [ -f "$CUE_DIR/.env.secure" ]; then
    echo "📦 备份现有配置..."
    cp "$CUE_DIR/.env.secure" "$CUE_DIR/.env.secure.backup.$(date +%Y%m%d)"
    echo "✅ 配置已备份"
fi

# 2. 备份用户数据（可选）
if [ -d "$CUE_DIR/users" ]; then
    echo "📦 备份用户数据..."
    cp -r "$CUE_DIR/users" "$CUE_DIR/users.backup.$(date +%Y%m%d)"
    echo "✅ 用户数据已备份"
fi

# 3. 删除旧版 skill 代码（保留配置目录）
echo "🗑️ 更新 skill 代码..."
rm -rf "$HOME/.openclaw/workspace/skills/cue" 2>/dev/null || true
rm -rf "$HOME/.openclaw/workspace/skills/cue-v1.0.7" 2>/dev/null || true

# 4. 克隆新版
cd "$HOME/.openclaw/workspace/skills"
git clone https://github.com/sensedeal/cue-skill.git cue
cd cue
npm install

echo ""
echo "✅ 升级完成!"
echo ""
echo "📋 注意："
echo "- API Key 通过系统环境变量管理（不再写入用户目录）"
echo "- 使用 OpenClaw Secrets (v2026.2.26+) 进行安全配置"
echo "- 不提供投资建议，只提供客观分析"
echo ""
echo "下一步："
echo "1. 重启 OpenClaw: openclaw restart"
echo "2. 测试: /cue 测试"
