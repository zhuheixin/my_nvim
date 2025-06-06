
1. 安装 Vim-Plug
自动安装（推荐）
运行以下命令下载 plug.vim 到 Vim 的自动加载目录：

bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



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

# 安装复制连接器
# sudo apt install xclip xsel

# 安装luarocks
sudo apt install luarocks
