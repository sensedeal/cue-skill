#!/usr/bin/env node
/**
 * Cue - 连接测试脚本
 * 用法：node test-connection.js
 */

import { existsSync } from 'fs';

console.log('🔌 Cue 环境连接测试\n');

// 1. 检查环境变量
const hasCueKey = !!process.env.CUECUE_API_KEY;
const hasTavilyKey = !!process.env.TAVILY_API_KEY;
const hasQverisKey = !!process.env.QVERIS_API_KEY;

// 2. 检测是否免费环境
const { execSync } = await import('child_process');

// 支持环境变量配置
let isFreeTier = false;
if (process.env.CUECUE_FREE_TIER === 'true') {
  isFreeTier = true;
} else if (process.env.CUECUE_FREE_TIER === 'false') {
  isFreeTier = false;
} else {
  // 回退到主机名检测
  let hostname = process.env.HOSTNAME || '';
  if (!hostname) {
    try {
      hostname = execSync('hostname').toString().trim();
    } catch (e) {
      hostname = '';
    }
  }
  isFreeTier = ['cuebot', 'cue-bot', 'cue-bot-local'].some(h => hostname.includes(h));
}

console.log('📋 环境变量检查');
console.log('─────────────────────────────────────');
console.log(`   CUECUE_API_KEY : ${hasCueKey ? '✅ 已配置' : '❌ 未配置'}`);
console.log(`   TAVILY_API_KEY : ${hasTavilyKey ? '✅ 已配置' : '❌ 未配置'}`);
console.log(`   QVERIS_API_KEY : ${hasQverisKey ? '✅ 已配置' : '❌ 未配置'}`);
console.log(`   免费额度环境 : ${isFreeTier ? '✅ 是' : '❌ 否'}`);
console.log('');

// 3. 检查工作区
const workspacePath = process.cwd();
const cuecuePath = workspacePath + '/.cuecue';
const hasWorkspace = existsSync(cuecuePath);

console.log('📁 工作区检查');
console.log('─────────────────────────────────────');
console.log(`   工作区路径：${workspacePath}`);
console.log(`   .cuecue 目录：${hasWorkspace ? '✅ 存在' : '❌ 不存在'}`);
console.log('');

// 4. 检查子目录
if (hasWorkspace) {
  console.log('📂 子目录状态');
  console.log('─────────────────────────────────────');
  console.log(`   tasks/      : ${existsSync(cuecuePath + '/tasks') ? '✅' : '❌'}`);
  console.log(`   monitors/   : ${existsSync(cuecuePath + '/monitors') ? '✅' : '❌'}`);
  console.log(`   notifications/: ${existsSync(cuecuePath + '/notifications') ? '✅' : '❌'}`);
  console.log('');
}

// 5. 总结
console.log('📊 总结');
console.log('─────────────────────────────────────');
if (hasCueKey || isFreeTier) {
  console.log('   ✅ 环境配置正常，可以开始使用！');
  console.log('');
  console.log('   使用命令：');
  console.log('   • cue <问题>     - 开始研究');
  console.log('   • cue -t         - 查看任务状态');
  console.log('   • cue -m         - 查看监控列表');
  console.log('   • cue --daemon-status - 查看守护进程状态');
} else {
  console.log('   ⚠️  需要配置 CUECUE_API_KEY');
  console.log('');
  console.log('   获取方式：');
  console.log('   1. 访问 https://cuecue.cn 注册');
  console.log('   2. 获取 API Key');
  console.log('   3. 发送 `/key 你的 APIKey` 配置');
}

console.log('');
