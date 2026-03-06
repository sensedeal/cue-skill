#!/usr/bin/env node
/**
 * Cue - 主入口（兼容层）
 * 为了兼容 OpenClaw 技能系统需要 index.js 作为入口
 * 实际入口在 bin/cue
 */

import { fileURLToPath } from 'url';
import path from 'path';
import { spawn } from 'child_process';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const binPath = path.join(__dirname, 'bin', 'cue');

const args = process.argv.slice(2);

const child = spawn('node', [binPath, ...args], {
  stdio: 'inherit',
  cwd: __dirname
});

child.on('exit', (code) => {
  process.exit(code);
});
