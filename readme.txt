

-- 配置github换源
git config --global url."https://githubfast.com/".insteadOf "https://github.com/"

# 安装telescope需要安装以下插件
apt install ripgrep

# 安装coc-nvim
apt-get install ccls

# 安装nodejs
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs
node -v


# 安装python跳转
pip install 'python-lsp-server[yapf,flake8]'
yapf -i file
::CocInstall @yaegassy/coc-pylsp
