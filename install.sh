PROJ_DIR="$(cd `dirname $0` ; pwd)"

INSTALL_PREFIX=$HOME

if [ $# -eq 1 ];then
  INSTALL_PREFIX=$1
  mkdir -p $INSTALL_PREFIX
fi

# add vimrc
ln -s ${PROJ_DIR}/vim/vimrc ${INSTALL_PREFIX}/.vimrc

# add zsh conf
ln -s ${PROJ_DIR}/zsh/zshrc ${INSTALL_PREFIX}/.zshrc
sh -c ${PROJ_DIR}/zsh/install.sh

# with oh-my-zsh to configure your reliance
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# shell integration
# curl -L https://iterm2.com/shell_integration/zsh \
# -o ~/.iterm2_shell_integration.zsh

# add gitconfig
ln -s ${PROJ_DIR}/git/gitconfig ${INSTALL_PREFIX}/.gitconfig

# add tmux conf
ln -s ${PROJ_DIR}/tmux/tmux.conf ${INSTALL_PREFIX}/.tmux.conf

# add pip conf
mkdir -p ${INSTALL_PREFIX}/.pip
ln -s ${PROJ_DIR}/pip/pip.conf ${INSTALL_PREFIX}/.pip/pip.conf
