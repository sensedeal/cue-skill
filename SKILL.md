# Cue - 你的专属调研助理 / Your AI Research Assistant

> 统一入口和智能路由中心，自动识别用户意图并路由到相应技能。

## ⚠️ 安全声明 / Security Notice

**安装前请仔细阅读 / Please read before installing:**

- 🔐 本 Skill 创建本地存储 `$HOME/.cuecue`
- ⏰ 后台任务：每30分钟运行监控守护进程
- 🌐 外部 API：需要访问 https://cuecue.cn
- 🔑 必需：CUECUE_API_KEY

## 安装 / Installation

```bash
# 克隆并安装
git clone https://github.com/sensedeal/cue-skill.git
cd cue-skill
npm install

# OpenClaw 中加载
# 复制到 skills 目录
```

## 核心功能 / Features

- 🔍 深度研究 - 5-30 分钟专业分析报告
- 🎯 自动模式识别 - 无需指定研究视角
- 👤 用户画像 - 个性化研究配置
- 📊 智能监控 - 自动追踪关注标的

## 命令 / Commands

| 命令 | 功能 |
|------|------|
| `/cue <主题>` | 智能调研 |
| `/ct` | 任务状态 |
| `/cm` | 监控列表 |
| `/cn` | 触发通知 |
| `/ch` | 帮助 |

## 环境变量 / Environment

| 变量 | 必需 | 说明 |
|------|------|------|
| CUECUE_API_KEY | 是 | API 密钥 |

## Tags

deep-research, finance, monitoring
