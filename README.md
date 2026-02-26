# Cue - 你的专属调研助理

> 让 AI 成为你的专业调研助手

## ⚠️ 安全声明

- 🔐 本 Skill 创建本地存储 `$HOME/.cuecue`
- ⏰ 后台任务：每30分钟运行监控守护进程
- 🌐 外部 API：需要访问 https://cuecue.cn
- 🔑 必需：CUECUE_API_KEY

## 快速开始

```bash
# 1. 克隆
git clone https://github.com/sensedeal/cue-skill.git cue-skill
cd cue-skill

# 2. 安装
npm install

# 3. 重启 OpenClaw
openclaw restart
```

## 命令

| 命令 | 功能 |
|------|------|
| `/cue <问题>` | 深度调研 |
| `/ct` | 任务状态 |
| `/cm` | 监控列表 |
| `/cn` | 触发通知 |
| `/key` | 配置 API |
| `/ch` | 帮助 |

## 用户画像（自动）

首次使用自动创建 `~/.cuecue/{chatId}/profile.json`：

```json
{
  "name": "ou_xxx",
  "role": "个人投资者",
  "risk_tolerance": "中等",
  "investment_style": "稳健",
  "focus_industries": ["新能源", "半导体"]
}
```

**自动学习**：研究完成后自动提取行业关键词到 focus_industries

## 监控流程

```
搜索 → 内容不足？→ 浏览器获取 → 触发通知
```

## 升级

```bash
./scripts/upgrade.sh
```

---

## 定时推送示例

### 设置每日热点推送

```bash
# 编辑 crontab
crontab -e

# 添加以下行：
# 每天 9:00 推送热点
0 9 * * * /path/to/cue-skill/examples/scheduled-push.sh "今日A股热点板块"

# 每天 16:00 推送下午简报
0 16 * * * /path/to/cue-skill/examples/scheduled-push.sh "今日市场总结"
```

### 自定义

修改 `examples/scheduled-push.sh` 中的 CHAT_ID 为目标用户。
