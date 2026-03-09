# Cue Skill 环境变量配置

**版本**: v1.0.6  
**日期**: 2026-03-10

---

## 🔑 环境变量总览

| 变量 | 必需 | 说明 | 默认值 |
|------|------|------|--------|
| `CUECUE_API_KEY` | 条件 | 深度研究 API Key | 无 |
| `CUECUE_FREE_TIER` | 否 | 是否启用免费额度 | 自动检测 |
| `TAVILY_API_KEY` | 否 | Tavily 搜索 API Key | 无 |
| `CHAT_ID` | 否 | 目标聊天 ID | 自动检测 |

---

## 🎁 CUECUE_FREE_TIER 配置

### 作用

控制是否启用免费额度（无需 API Key 即可使用）。

### 优先级

```
环境变量 > 主机名检测
```

### 使用方式

#### 1. 启用免费额度
```bash
export CUECUE_FREE_TIER=true
```

#### 2. 禁用免费额度
```bash
export CUECUE_FREE_TIER=false
```

#### 3. 不设置（回退到自动检测）
```bash
# 不设置环境变量，系统自动检测主机名
# 如果主机名包含 'cuebot', 'cue-bot', 'cue-bot-local' 则启用
```

---

## 📊 检测逻辑

```javascript
function isFreeTierEnvironment() {
  // 1. 优先使用环境变量（显式配置）
  if (process.env.CUECUE_FREE_TIER === 'true') return true;
  if (process.env.CUECUE_FREE_TIER === 'false') return false;
  
  // 2. 回退到主机名检测（向后兼容）
  const hostname = process.env.HOSTNAME || '...';
  return ['cuebot', 'cue-bot', 'cue-bot-local']
    .some(host => hostname.includes(host));
}
```

---

## 🧪 测试验证

### 测试 1: 显式启用
```bash
$ CUECUE_FREE_TIER=true cue --test-connection
🔌 测试 API 连接...
   CUECUE_API_KEY: ❌ 未配置
   免费额度环境：✅ 是
✅ 环境配置正常，可以开始使用！
```

### 测试 2: 显式禁用
```bash
$ CUECUE_FREE_TIER=false cue --test-connection
🔌 测试 API 连接...
   CUECUE_API_KEY: ❌ 未配置
   免费额度环境：❌ 否
⚠️  需要配置 CUECUE_API_KEY 才能使用深度研究功能
```

### 测试 3: 自动检测（默认）
```bash
$ cue --test-connection
🔌 测试 API 连接...
   免费额度环境：✅ 是  # 主机名=cuebot
✅ 环境配置正常，可以开始使用！
```

---

## 🔧 配置场景

### 场景 1: 开发环境（启用免费额度）
```bash
# .env 或 ~/.bashrc
export CUECUE_FREE_TIER=true
```

### 场景 2: 生产环境（需要 API Key）
```bash
# .env 或系统环境变量
export CUECUE_FREE_TIER=false
export CUECUE_API_KEY=skb_xxxxxxxxxxxx
```

### 场景 3: Docker 容器
```dockerfile
ENV CUECUE_FREE_TIER=true
ENV CUECUE_API_KEY=skb_xxxxxxxxxxxx
```

### 场景 4: OpenClaw Secrets
```json
{
  "cuecue_free_tier": "true",
  "cuecue_api_key": "skb_xxxxxxxxxxxx"
}
```

---

## 📝 最佳实践

### ✅ 推荐

1. **开发环境**: 使用 `CUECUE_FREE_TIER=true`
2. **生产环境**: 配置 `CUECUE_API_KEY` + `CUECUE_FREE_TIER=false`
3. **测试环境**: 使用自动检测（不设置环境变量）

### ❌ 避免

1. 硬编码主机名（已改进为支持环境变量）
2. 在代码中写死免费额度逻辑
3. 忽略环境变量优先级

---

## 🎯 总结

**v1.0.6 改进**:
- ✅ 新增 `CUECUE_FREE_TIER` 环境变量支持
- ✅ 优先级：环境变量 > 主机名检测
- ✅ 向后兼容，不影响现有环境
- ✅ 支持所有环境灵活配置

**使用示例**:
```bash
# 启用免费额度
export CUECUE_FREE_TIER=true

# 禁用免费额度（需要 API Key）
export CUECUE_FREE_TIER=false
export CUECUE_API_KEY=skb_xxxxxxxxxxxx

# 测试配置
cue --test-connection
```
