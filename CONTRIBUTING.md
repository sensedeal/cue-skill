# 贡献指南

感谢你有兴趣为 Cue Skill 做出贡献！

## 开发环境设置

### 1. 克隆仓库
```bash
git clone https://github.com/your-org/cue-skill.git
cd cue-skill
```

### 2. 安装依赖
```bash
npm install
```

### 3. 链接本地 cuebot（开发模式）
```bash
cd ../cuebot
npm link
cd ../cue-skill
npm link @cuebot/skill
```

## 项目结构

```
cue-skill/
├── bin/                    # 可执行文件
├── docs/                   # 文档
├── examples/               # 示例
├── scripts/                # 脚本
├── index.js                # 主入口
├── manifest.json           # Skill 清单
├── SKILL.md               # Skill 定义
└── package.json
```

## 开发流程

### 本地开发
1. 修改 cuebot 或 cue-skill 源码
2. 运行 `npm test` 确保测试通过
3. 使用 `sync.sh` 同步到测试环境
4. 验证功能正常

### 发布流程
1. 更新版本号
2. 运行 `npm run build`（如果需要）
3. 提交 git
4. 发布到 npm

## 代码风格

- 遵循 cuebot 的代码风格
- 使用 ES6+ 语法
- 添加必要的注释和文档
- 保持与 cuebot 的 API 兼容

## 提交规范

使用语义化提交信息：

```
<type>(<scope>): <subject>

类型：
- feat: 新功能
- fix: 修复
- docs: 文档
- style: 格式
- refactor: 重构
- test: 测试
- chore: 构建/工具
```

## 测试要求

- 确保与 cuebot 的集成测试通过
- 在本地环境验证功能
- 使用同步脚本测试完整流程

## 提交 Pull Request

1. Fork 项目
2. 创建特性分支
3. 提交更改
4. 推送到分支
5. 开启 Pull Request

## 与 cuebot 协作

cue-skill 依赖 cuebot 核心库：

- **cuebot**: 核心逻辑库，发布为 `@cuebot/skill`
- **cue-skill**: OpenClaw Skill 包装层

开发时使用 `npm link` 链接本地版本。

## 获取帮助

有问题？请开启 Issue 或联系维护者。

---

再次感谢你的贡献！🎉
