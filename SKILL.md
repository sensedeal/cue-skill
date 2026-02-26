# Cue - 你的专属调研助理 / Your AI Research Assistant

> 让 AI 成为你的专业调研助理

## ⚠️ 安全声明 / Security Notice

- 🔐 本 Skill 创建本地存储 `$HOME/.cuecue`
- ⏰ 后台任务：每30分钟运行监控守护进程
- 🌐 外部 API：需要访问 https://cuecue.cn
- 🔑 必需：CUECUE_API_KEY

## 核心特色 / Key Features

| 特色 | 说明 |
|------|------|
| 🔍 深度研究 | 5-30 分钟生成专业分析报告 |
| 🎯 自动识别 | 无需指定模式，系统自动匹配研究视角 |
| 👤 个性化 | 支持用户画像配置 |
| 📊 智能监控 | 自动追踪关注标的，触发通知 |

## 快速开始 / Quick Start

```
1. 发送 /cue <研究主题>
2. 等待研究完成（5-30分钟）
3. 自动收到研究报告
4. 可选择创建监控项
```

## 安装 / Installation

```bash
git clone https://github.com/sensedeal/cue-skill.git
cd cue-skill && npm install
```

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
