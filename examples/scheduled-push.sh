#!/bin/bash
# 定时热点推送示例
# 使用 crontab 设置：
# 0 9 * * * /path/to/examples/scheduled-push.sh "今日热点"
# 0 16 * * * /path/to/examples/scheduled-push.sh "下午简报"

TOPIC=${1:-"今日A股热点"}
CHAT_ID=${2:-""}

echo "🔍 正在研究：$TOPIC"

# 调用 OpenClaw 执行研究
openclaw exec -m "发送 /cue $TOPIC" --chat-id "$CHAT_ID" 2>/dev/null || \
curl -X POST "http://localhost:8080/api/chat" \
  -H "Content-Type: application/json" \
  -d "{\"message\": \"/cue $TOPIC\", \"chat_id\": \"$CHAT_ID\"}"

echo "✅ 研究任务已提交"
