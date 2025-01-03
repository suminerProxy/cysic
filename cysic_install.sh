#!/bin/bash
# 检查是否提供了参数
if [ $# -eq 0 ]; then
  echo "未提供参数！请传递至少一个参数。"
  echo "用法: ./script.sh 参数1 参数2 ..."
  exit 1
fi
# 确保以 root 用户运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 用户运行此脚本"
  exit 1
fi

echo "检查和安装 pm2..."

# 检查是否已安装 Node.js 和 npm
if ! command -v node &> /dev/null; then
  echo "未检测到 Node.js，开始安装 Node.js 和 npm..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt install -y nodejs
else
  echo "Node.js 已安装，版本：$(node -v)"
fi

# 检查是否已安装 pm2
if ! command -v pm2 &> /dev/null; then
  echo "未检测到 pm2，正在通过 npm 全局安装 pm2..."
  npm install -g pm2
  echo "pm2 安装完成，版本：$(pm2 -v)"
else
  echo "pm2 已安装，版本：$(pm2 -v)"
fi

echo "开始安装cysic"

curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/setup_linux.sh > ~/setup_linux.sh && bash ~/setup_linux.sh $1
cd ~/cysic-verifier/ && bash start.sh
