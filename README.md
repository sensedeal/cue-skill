# Cue - 你的专属调研助理

> 让 AI 成为你的专业调研助手

## ⚠️ 安全声明

- 🔐 API Key 通过系统环境变量或 OpenClaw Secrets (v2026.2.26+) 管理
- 🔐 不写入用户工作区文件，确保安全隔离
- ⏰ 后台任务：每30分钟运行监控守护进程
- 🌐 外部 API：需要访问 https://cuecue.cn
- ⚠️ **合规声明**：不提供投资建议，只提供客观分析

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

## 环境配置

| 变量 | 必需 | 说明 |
|------|------|------|
| CUECUE_API_KEY | 是 | 深度研究 API Key |
| TAVILY_API_KEY | 否 | 搜索 API Key |
| QVERIS_API_KEY | 否 | 搜索 API 备用 |

**推荐**：使用 OpenClaw Secrets 进行配置管理（支持热更新）

## 命令

| 命令 | 功能 |
|------|------|
| `/cue <问题>` | 深度调研 |
| `/ct` | 任务状态 |
| `/cm` | 监控列表 |
| `/cn` | 触发通知 |
| `/ch` | 帮助 |

## 研究视角（6种）

- 📈 **短线交易** - 龙虎榜、涨停、资金流向
- 💼 **基金经理** - 财报、估值、基本面
- 🔬 **产业研究** - 产业链、竞争格局
- 💰 **理财顾问** - 资产配置、风险控制
- 📊 **宏观分析** - GDP、CPI、货币政策
- 🌀 **行业轮动** - 板块轮动、热点

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
