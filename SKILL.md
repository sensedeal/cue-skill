---
name: Cue
description: 你的专属调研助理。当用户需要进行深度研究、行业分析、公司调研、市场趋势分析时调用此技能。 - AI Research Assistant. Use when users need deep research, industry analysis, company research, or market trend analysis.
icon: 🔍
user-invocable: true

# ============ 自动触发配置 ============
auto-trigger:
  enabled: true
  confidence_threshold: 0.6
  fallback: "suggest"
  timeout_seconds: 30
# ====================================

read_when:
  - 深度研究
  - 深度调研
  - 深度分析
  - 行业分析
  - 行业趋势
  - 行业竞争
  - 竞争格局
  - 产业链
  - 供应链
  - 公司调研
  - 公司分析
  - 企业分析
  - 财报分析
  - 估值分析
  - 基本面分析
  - 市场趋势
  - 市场分析
  - 市场研究
  - 投资建议
  - 资产配置
  - 风险控制
  - 投资研究
  - 理财顾问
  - 宏观经济
  - 宏观分析
  - GDP
  - CPI
  - 货币政策
  - 财政政策
  - 行业轮动
  - 板块轮动
  - 景气度
  - 风口
  - 赛道
  - 分析xx趋势
  - 研究xx
  - 调研xx
  - xx行业分析
  - xx公司分析
  - 龙虎榜
  - 涨停
  - 资金流向
  - 短线交易
  - 技术分析
  - 基金经理
  - 产业研究
  - 理财
  - 投资
  - 分析
  - 研究
  - 调研
  - 趋势
  - 格局
  - 竞争
  - 估值
  - 财报
  - 市场
  - 行业
  - 公司
  - 企业
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

# 重启 OpenClaw Gateway 生效
openclaw gateway restart
```

**重要：** 安装或修改 Skill 后必须重启 Gateway 才能生效！

## 命令 / Commands

| 命令 / Command | 功能 / Function |
|----------------|----------------|
| `/cue <问题>` | 深度调研 / Deep research |
| `cue -t` 或 `/ct` | 任务状态 / Task status |
| `cue -m` 或 `/cm` | 监控列表 / Monitor list |
| `/cm add` | 主动创建监控 / Create monitor manually |
| `cue -n` 或 `/cn` | 触发通知 / Trigger notifications |
| `/key` | 配置 API / Configure API |
| `/ch` | 帮助 / Help |
| `/cancel` | 取消当前任务 / Cancel current task |

## 📊 监控创建流程 / Monitor Creation Flow

### 方式一：研究完成后推荐创建（推荐）
```
1. 完成深度研究（`/cue <问题>`）
2. 等待研究完成（5-30 分钟）
3. 研究完成后，系统自动提供监控建议卡片
4. 点击卡片上的"创建监控"按钮，或回复 Y
5. 使用 `/cm` 查看和管理所有监控项
```

### 方式二：主动创建监控（新增）
```
1. 使用 `/cm add` 命令主动创建监控
2. 选择监控模板或提供关注主题
3. 系统推荐适合的监控类型
4. 确认创建，立即生效
5. 使用 `/cm` 查看和管理所有监控项
```

**主动创建示例：**
```bash
# 查看所有可用监控模板
/cm add

# 创建特定类型监控
/cm add competitive_landscape 新能源汽车

# 智能推荐监控
/cm add 人工智能
```

### 常见误区 / Common Mistakes

| ❌ 错误 | ✅ 正确 |
|--------|--------|
| 使用 `--monitor` 参数 | 不存在此参数 |
| 研究命令中直接创建监控 | 研究完成后从推荐中选择 |
| 手动输入监控配置 | 使用系统推荐的监控模板 |

### 监控命令 / Monitor Commands

```bash
# 查看监控列表
cue -m
/cm

# 查看监控触发通知（最近 3 天）
cue -n
/cn

# 查看监控触发通知（最近 7 天）
cue -n 7
/cn 7

# 取消当前任务
/cancel
```

## 环境变量 / Environment Variables

| 变量 / Variable | 必需 / Required | 说明 / Description |
|-----------------|-----------------|-------------------|
| CUECUE_API_KEY | 是 / Yes | API 密钥（通过系统环境变量或 OpenClaw Secrets）/ API Key (via env or Secrets) |
| TAVILY_API_KEY | 否 / No | 搜索 API 密钥 / Search API Key |
| QVERIS_API_KEY | 否 / No | 搜索 API 备用 / Search API Backup |

## Tags

deep-research, finance, monitoring, research, ai-assistant

## 📖 使用示例 / Examples

### 深度研究
```
/cue "分析宁德时代竞争优势"
cue "比亚迪值得投资吗"
```

### 任务状态
```
cue -t
/cue -t
```

### 监控列表
```
cue -m
/cm
```

### 通知记录
```
cue -n        # 最近3天
cue -n 7     # 最近7天
```

### 配置 API
```
cue -k your-api-key
/key your-api-key
```

### 帮助
```
cue -h
/ch
```
