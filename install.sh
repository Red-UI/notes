command_exists() {
  type "$1" &> /dev/null ;
}

echo 'Step 1/3: 检查 Node.js 是否安装'
if command_exists node; then
  echo "Node.js 已经安装, 版本号：$(node -v)"
else
  echo "Node.js 未安装，请先自行安装"
  exit 1
fi

echo 'Step 2/3: 检查 cnpm 是否安装'
if command_exists cnpm; then
  echo "cnpm 已经安装, 版本号：$(cnpm -v)"
else
  echo "cnpm 未安装，自动安装..."
  npm install cnpm -g --registry=https://registry.npm.taobao.org
fi

echo 'Step 3/3: 安装 RedUI-SDK...'
cnpm i redui-packer -g

echo "安装完成。输入命令行 red 了解更多。"
