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
| CUECUE_API_KEY | 条件 | 深度研究 API Key（部分环境如 cuebot 有免费额度，无需配置） |
| TAVILY_API_KEY | 否 | 搜索 API Key |
| QVERIS_API_KEY | 否 | 搜索 API 备用 |

**推荐**：使用 OpenClaw Secrets 进行配置管理（支持热更新）

### 🎁 免费额度

**当前环境（cuebot）已配置每日免费额度，无需 API Key！**

- 🔍 深度研究：3 次/日
- 📈 智能监控：5 个
- 💬 免费对话：50 次/日

其他环境需访问 https://cuecue.cn 注册获取 API Key。

## 命令

| 命令 | 功能 |
|------|------|
| `/cue <问题>` | 深度调研 |
| `/ct` | 任务状态 |
| `/cm` | 监控列表 |
| `/cn` | 触发通知 |
| `cue --daemon-status` | 守护进程状态 |
| `cue --test-connection` | 测试连接 |
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

## 多 Channel 支持

从 v1.0.6 开始，支持多 channel（telegram、discord 等）：

### 环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `OPENCLAW_CHANNEL` | 消息 channel 类型 | `feishu` |

### 工作区路径

数据存储路径：`/root/.openclaw/workspaces/{channel}-{user_id}/.cuecue`

示例：
- 飞书用户：`feishu-{user_id}`
- Telegram 用户：`telegram-{user_id}`

---

## 📚 文档中心

查看完整文档：[docs/README.md](./docs/README.md)

### 用户文档
- ⭐ [快速开始指南](./docs/QUICKSTART.md) - 5分钟上手教程
- 📖 [功能使用说明](./docs/USAGE.md) - 完整功能详解
- ❓ [常见问题解答](./docs/FAQ.md) - 用户常见问题
- 🚀 [新功能特性](./docs/FEATURES.md) - Phase 1-4 介绍

### 开发者文档
- 🔧 [API 接口文档](../cuebot/docs/API.md) - 完整 API 说明
- 🧪 [测试用例文档](../cuebot/docs/TESTING.md) - Phase 1-4 测试覆盖

---

## ✨ Phase 1-4 已完成！

Cue Skill 优化方案 4 个阶段已全部完成：

| 阶段 | 功能 |
|------|------|
| **Phase 1** | 基础增强（问题类型/复杂度/实体） |
| **Phase 2** | 动态框架（多复杂度/动态选择/实体定制） |
| **Phase 3** | 个性化（用户历史/个性化框架/偏好学习） |
| **Phase 4** | 智能路由（8维度意图/多阶段决策/智能提示词） |

查看 [新功能特性](./docs/FEATURES.md) 了解更多！
