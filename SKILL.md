---
name: Cue
description: 你的专属调研助理。当用户需要进行深度研究、行业分析、公司调研、市场趋势分析时调用此技能。 - AI Research Assistant. Use when users need deep research, industry analysis, company research, or market trend analysis.
icon: 🔍
---

# Cue - 你的专属调研助理 / Your AI Research Assistant

> 让 AI 成为你的专业调研助手 / Let AI be your professional research assistant

## ⚠️ 安全声明 / Security Notice

- 🔐 本 Skill 使用系统环境变量存储 API Key / Uses system environment variables for API keys
- 🔐 通过 OpenClaw Secrets (v2026.2.26+) 管理敏感配置 / Manages secrets via OpenClaw Secrets
- ⏰ 后台任务：每30分钟运行监控守护进程 / Background tasks: Monitor daemon runs every 30 minutes
- 🌐 外部 API：需要访问 https://cuecue.cn / External API: Requires access to https://cuecue.cn
- 🔑 必需：CUECUE_API_KEY / Required: CUECUE_API_KEY
- ⚠️ **合规声明**：不提供投资建议，只提供客观分析 / **Compliance**: No investment advice, objective analysis only

## 核心特色 / Key Features

| 特色 / Feature | 说明 / Description |
|----------------|-------------------|
| 🔍 深度研究 / Deep Research | 5-30 分钟生成专业分析报告 / Generate professional analysis reports in 5-30 minutes |
| 🎯 自动识别 / Auto Detection | 无需指定模式，系统自动匹配研究视角（6种）/ Auto-matches research perspective (6 modes) |
| 👤 个性化 / Personalization | 支持用户画像配置 / Supports user profile configuration |
| 📊 智能监控 / Smart Monitoring | 自动追踪关注标的，触发通知 / Auto-tracks assets and sends notifications |

## 研究视角 / Research Modes

- 📈 **短线交易** - 龙虎榜、涨停、资金流向分析
- 💼 **基金经理** - 财报、估值、基本面分析
- 🔬 **产业研究** - 产业链、竞争格局、技术路线
- 💰 **理财顾问** - 投资建议、资产配置、风险控制
- 📊 **宏观分析** - GDP、CPI、货币政策
- 🌀 **行业轮动** - 板块轮动、热点、景气度

## 快速开始 / Quick Start

```
1. 发送 /cue <研究问题> / Send /cue <research question>
2. 等待研究完成（5-30分钟）/ Wait for research completion (5-30 min)
3. 自动收到研究报告 / Receive research report automatically
4. 可选择创建监控项 / Optionally create monitoring items
```

## 安装 / Installation

```bash
git clone https://github.com/sensedeal/cue-skill.git
cd cue-skill && npm install
```

## 命令 / Commands

| 命令 / Command | 功能 / Function |
|----------------|----------------|
| `/cue <问题>` | 深度调研 / Deep research |
| `/ct` | 任务状态 / Task status |
| `/cm` | 监控列表 / Monitor list |
| `/cn` | 触发通知 / Trigger notifications |
| `/key` | 配置 API / Configure API |
| `/ch` | 帮助 / Help |

## 环境变量 / Environment Variables

| 变量 / Variable | 必需 / Required | 说明 / Description |
|-----------------|-----------------|-------------------|
| CUECUE_API_KEY | 是 / Yes | API 密钥（通过系统环境变量或 OpenClaw Secrets）/ API Key (via env or Secrets) |
| TAVILY_API_KEY | 否 / No | 搜索 API 密钥 / Search API Key |
| QVERIS_API_KEY | 否 / No | 搜索 API 备用 / Search API Backup |

## Tags

deep-research, finance, monitoring, research, ai-assistant
