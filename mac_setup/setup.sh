#! /bin/bash
set -e

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

xcode-select --install || echo 'ja tem xcode tools'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
    git \
    git-lfs \
    asdf \
    jq \
    nvim \
    ffmpeg \
    ripgrep \
    nginx \
    curl \
    youtube-dl \
    htop \
    wget
brew install --cask \
    docker \
    eloston-chromium \
    firefox \
    visual-studio-code \
    menumeters \
    dropbox  \
    slack \
    telegram \
    insomnia \
    intellij-idea \
    iterm2 \
    activitywatch

# iterm 2 integration
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

asdf plugin add python
asdf install python latest
asdf global python latest

asdf plugin add nodejs
asdf install nodejs 14.17.5
asdf global nodejs 14.17.5

asdf global python latest

asdf plugin add java
asdf install java openjdk-11
asdf install java liberica-jre-javafx-17.0.2+9
asdf global java liberica-jre-javafx-17.0.2+9

asdf plugin add golang
asdf install golang latest
asdf global golang latest

asdf plugin add ruby
asdf install ruby 3.1.2
asdf global ruby 3.1.2

ln -s ~/.vimrc $(realpath ../.vimrc)
mkdir -p ~/.config/nvim
ln -s ~/.config/nvim/init.vim $(realpath ../.config/nvim/init.vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/.zshrc $(realpath ../.zshrc)



wait
for extension in "activitywatch.aw-watcher-vscode" "apollographql.vscode-apollo" "arcanis.vscode-zipfs" "asvetliakov.snapshot-tools" "bierner.markdown-mermaid" "dbaeumer.vscode-eslint" "eamodio.gitlens" "EditorConfig.EditorConfig" "esbenp.prettier-vscode" "flowtype.flow-for-vscode" "gamunu.vscode-yarn" "jasonnutter.vscode-codeowners" "letmaik.git-tree-compare" "ms-python.python" "ms-python.vscode-pylance" "ms-toolsai.jupyter" "ms-toolsai.jupyter-keymap" "ms-toolsai.jupyter-renderers" "redhat.java" "redhat.vscode-xml" "redhat.vscode-yaml" "streetsidesoftware.code-spell-checker" "tamasfe.even-better-toml" "teamchilla.blueprint" "tomoyukim.vscode-mermaid-editor" "VisualStudioExptTeam.vscodeintellicode" "vscjava.vscode-java-debug" "vscjava.vscode-java-dependency" "vscjava.vscode-java-pack" "vscjava.vscode-java-test" "vscjava.vscode-maven" "vscodevim.vim" "yzhang.markdown-all-in-one"
do
  code --install-extension $extension --force 
done

pip install ntfy[telegram]
