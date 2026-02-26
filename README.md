# Cue - 调研助理

详细使用说明见 [SKILL.md](./SKILL.md)

## 快速开始

```bash
# 1. 克隆
git clone https://github.com/sensedeal/cue-skill.git

# 2. 安装依赖
cd cue-skill
npm install

# 3. 加载到 OpenClaw
# 复制到 ~/.openclaw/skills/ 或使用 clawhub
```

## 功能详解

### 深度研究

输入研究问题，5-30 分钟生成专业报告：

```
/cue 分析宁德时代竞争优势
/cue 新能源汽车行业分析
```

### 自动模式识别

系统自动识别研究视角：
- 短线交易（龙虎榜、资金流向）
- 基金经理（财报、估值）
- 研究员（产业链、竞争格局）
- 理财顾问（投资建议、资产配置）

### 用户画像

创建 `~/.cuecue/{chatId}/profile.json`：

```json
{
  "investmentStyle": "短线交易",
  "riskPreference": "激进",
  "focusAreas": ["新能源", "半导体"],
  "holdings": ["宁德时代"]
}
```

### 智能监控

研究完成后自动生成监控建议，回复 Y 创建监控项。

## OpenClaw 集成

### Cron 调度

优先使用 OpenClaw Gateway Cron，降级使用内部 node-cron。

### Subagent 并行

Gateway 环境下支持并行研究任务。

## 故障排除

### API Key 配置

```bash
# 方式1: 环境变量
export CUECUE_API_KEY="your-key"

# 方式2: /key 命令
```

### 查看日志

```bash
# OpenClaw 日志
openclaw logs

# 技能日志
cat ~/.cuecue/{chatId}/logs/*.log
```

## 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0.5 | 2026-02-27 | 分离式架构（skill + cuebot） |
| v1.0.4 | 2026-02-25 | Node.js 重构 |
| v1.0.3 | 2026-02-25 | 自动模式识别 |
| v1.0.1 | 2026-02-24 | 初始版本 |

## 许可证

MIT

---

## 升级指南 / Upgrade Guide

### 从旧版升级

```bash
# 克隆新版
git clone https://github.com/sensedeal/cue-skill.git cue-skill
cd cue-skill

# 运行升级脚本
./scripts/upgrade.sh
```

升级脚本会自动：
- 备份现有配置
- 保留您的 CUECUE_API_KEY
- 更新到最新版本

### 配置保留

升级时自动保留：
- `~/.cuecue/.env.secure` - API 配置
- `~/.cuecue/users/` - 用户数据

### 首次安装

```bash
git clone https://github.com/sensedeal/cue-skill.git cue-skill
cd cue-skill
./scripts/install.sh
```

---

## 用户画像配置（可选）

创建 `~/.cuecue/users/default.json`:

```json
{
  "name": "用户名",
  "role": "基金经理",
  "focus_industries": ["新能源", "半导体"],
  "investment_style": "价值投资",
  "risk_tolerance": "中等"
}
```

设置后，研究时会自动匹配更适合您的视角。

---

## 监控执行流程

```
1. 搜索触发
   └─ Tavily / QVeris 搜索关键词
   
2. 内容评估
   └─ 内容不足？ → 浏览器获取
   
3. 触发判断
   └─ 匹配度高？ → 发送通知
   
4. 用户确认
   └─ 可创建新监控或调整
```

### 数据源优先级

1. **Tavily** - 实时新闻搜索
2. **QVeris** - API 搜索
3. **免费 API** - Yahoo/Google/Tencent Finance（预留）
4. **浏览器** - 动态页面获取
