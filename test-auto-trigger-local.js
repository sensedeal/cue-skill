
/**
 * 测试自动触发功能（本地测试）
 */

import { detectResearchIntent } from '/root/hdm/cuebot/src/index.js';

const testCases = [
  "分析宁德时代竞争优势",
  "比亚迪的财报怎么样",
  "你好",
  "谢谢",
  "今天吃什么",
  "新能源行业前景如何"
];

console.log('🧪 测试自动触发功能\n');

for (const input of testCases) {
  console.log(`📝 输入: "${input}"`);
  
  const intent = detectResearchIntent(input);
  
  if (intent) {
    console.log(`✅ 检测到研究意图: ${intent.topic} (置信度: ${intent.confidence})`);
  } else {
    console.log(`❌ 未检测到研究意图`);
  }
  
  console.log('---');
}

console.log('\n✨ 测试完成！');
