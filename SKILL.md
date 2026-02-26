# Cue - 你的专属调研助理 / Your AI Research Assistant

统一入口和智能路由中心，自动识别用户意图并路由到相应技能。基于 Cue 产品设计，提供专业化的深度研究体验。

> A unified entry and intelligent routing center that automatically recognizes user intent and routes to appropriate skills. Based on Cue product design, providing professional deep research experience.

## ⚠️ 安全声明 / Security Notice

**安装前请仔细阅读 / Please read before installing:**

本 Skill 是一个具有持久化状态和后台行为的金融研究+监控工具：
- 🔐 **本地存储 / Local Storage**: 会在 `$HOME/.cuecue` 创建持久化数据目录（用户数据、任务、监控配置、日志）
- ⏰ **后台任务 / Background Jobs**: 安装后会添加 cron 定时任务（每30分钟运行监控守护进程）
- 🌐 **外部 API / External APIs**: 需要访问 https://cuecue.cn 和可选的 https://api.tavily.com
- 🔑 **环境变量 / Environment Variables**: 需要 CUECUE_API_KEY（必需），可选 TAVILY_API_KEY
- 📢 **通知权限 / Notification**: 可能复用 OpenClaw 渠道令牌（如 FEISHU_*）发送通知

**This Skill is a financial research + monitoring tool with persistent state and background behavior:**
- Creates persistent local storage at `$HOME/.cuecue` (user data, tasks, monitors, logs)
- Installs cron job running every 30 minutes for monitoring
- Requires external API access to https://cuecue.cn
- Requires CUECUE_API_KEY (required), optional TAVILY_API_KEY
- May reuse OpenClaw channel tokens (e.g., FEISHU_*) for notifications

## Tags

deep-research, finance, business, industry, company-analysis, multi-agent, monitoring

---

## 安装方式 / Installation

### 方式一：从 GitHub 安装 / Install from GitHub

```bash
# 1. 克隆 skill 仓库
git clone https://github.com/sensedeal/cue-skill.git

# 2. 安装依赖（自动安装 cuebot）
cd cue-skill
npm install

# 3. 在 OpenClaw 中加载
# 将文件复制到 OpenClaw skills 目录
```

### 方式二：从 npm 安装 cuebot / Install cuebot from npm

```bash
# cuebot 核心库已发布到私有 npm（需要配置 .npmrc）
npm install cuebot
```

### 方式三：使用 ClawHub / Use ClawHub

```bash
clawhub install cue-skill
```

---

## 核心功能 / Core Functions

#### 1. 深度研究（Deep Research）

直接输入研究主题，AI 自动进行多 Agent 并行深度研究，5-30 分钟生成专业分析报告。

> Enter a research topic directly, and AI will automatically conduct multi-agent parallel deep research, generating professional analysis reports in 5-30 minutes.

**示例 / Examples:**
```
分析宁德时代竞争优势
新能源汽车行业前景如何？
```

#### 2. 自动模式识别 / Auto Mode Detection

系统根据主题自动匹配最适合的研究视角：

> System automatically matches the best research perspective:

| 模式 / Mode | 自动匹配关键词 / Auto-match Keywords | 研究框架 / Framework |
|------------|-------------------------------------|---------------------|
| 短线交易 / Trader | 龙虎榜、涨停、游资、资金流向、换手率 | 市场微观结构与资金流向分析 |
| 基金经理 / Fund Manager | 财报、估值、业绩、年报、ROE、PE | 基本面分析与估值模型 |
| 研究员 / Researcher | 产业链、竞争格局、技术路线、供应链 | 产业链拆解与竞争力评估 |
| 理财顾问 / Advisor | 投资建议、资产配置、风险控制、定投 | 资产配置与风险收益评估 |

#### 3. 用户画像个性化 / User Profile Personalization

支持用户画像，让研究更精准：

> User profile for personalized research:

```
~/.cuecue/{chatId}/profile.json
{
  "investmentStyle": "短线交易",
  "riskPreference": "激进",
  "focusAreas": ["新能源", "半导体"],
  "holdings": ["宁德时代", "比亚迪"]
}
```

#### 4. 智能监控 / Smart Monitoring

- 🤖 AI 分析：从报告中提取关键监控信号
- 📊 量化指标：提取可量化的监控维度
- 🔔 自动创建：回复 Y 自动创建监控项

---

## 可用命令 / Available Commands

| 命令 / Command | 功能 / Function | 耗时 / Duration |
|---------------|----------------|----------------|
| `/cue <主题>` | 智能调研（自动匹配研究视角） | 5-30 分钟 |
| `/ct` | 查看所有研究任务状态 | 即时 |
| `/cm` | 查看监控项列表 | 即时 |
| `/cn [天数]` | 查看监控触发通知 | 即时 |
| `/cs <任务ID>` | 查看特定任务详情 | 即时 |
| `/ch` | 显示帮助 | 即时 |
| `/key` | 配置 API Key | 即时 |

---

## 代码结构 / Code Structure

### 分离式架构 / Separated Architecture

```
cue-skill (OpenClaw Skill - 公开)
├── SKILL.md           # 技能说明文档
├── manifest.json       # OpenClaw 技能配置
└── package.json       # 依赖 cuebot

cuebot (NPM 包 - 私有)
├── package.json       # NPM 包配置
├── index.js           # 统一导出
└── src/
    ├── api/          # API 客户端
    ├── core/         # 核心模块
    ├── utils/        # 工具函数
    ├── cron/         # 定时任务
    └── notifier/    # 通知推送
```

### 优势 / Advantages

- 🔄 **版本独立管理** - cuebot 可独立发布 npm 版本
- 📦 **轻量级发布** - skill 只包含元数据
- 🔒 **代码保护** - 核心代码私有，不公开
- ⚡ **快速更新** - 修改代码无需重新发布 skill

---

## 环境变量 / Environment Variables

### 必需 / Required

| 变量名 | 说明 | 获取方式 |
|--------|------|---------|
| `CUECUE_API_KEY` | CueCue 深度研究 API 密钥 | https://cuecue.cn |

### 可选 / Optional

| 变量名 | 说明 | 用途 |
|--------|------|------|
| `TAVILY_API_KEY` | Tavily 搜索 API | 监控新闻搜索 |
| `CHAT_ID` | 当前对话 ID | 用户识别 |

---

## 数据隔离 / Data Isolation

每个用户的数据存储在独立目录：
```
~/.cuecue/users/${chat_id}/
├── .initialized     # 用户初始化标记
├── tasks/          # 用户专属研究任务
├── monitors/      # 用户专属监控配置
└── profile.json   # 用户画像
```

---

## 版本历史 / Version History

### v1.0.5 (2026-02-27)
- 🔧 **架构重构**：分离式发布 - skill 与核心库分离
- ✨ **cuebot 核心库**：将核心代码发布为 npm 包
- ✨ **用户画像**：支持个性化研究配置
- ✨ **自动路由**：自然语言直接触发深度研究
- ✅ **OpenClaw 集成**：优先复用 OpenClaw Cron 和 Subagent
- 🔧 修复：多个 bug 修复和优化

### v1.0.4 (2026-02-25)
- 🔧 全面 Node.js 重构 - 基于 ES Module 的现代架构

### v1.0.3 (2026-02-25)
- ✨ 新增：自动角色匹配、智能状态检测

### v1.0.1 (2026-02-24)
- ✨ 产品定位更新，timeout 优化

### v1.0.0 (2026-02-23)
- 🎉 初始发布

---

*Powered by CueCue | 让 AI 成为你的调研助理*
