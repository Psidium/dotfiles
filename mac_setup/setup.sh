#! /bin/bash
set -e

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

xcode-select --install || echo 'ja tem xcode tools'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

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
    thefuck \
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
    hiddenbar \
    calibre \
    activitywatch

# iterm 2 integration
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

asdf plugin add python
asdf install python latest
asdf global python latest

asdf plugin add nodejs
asdf install nodejs 14.18.2
asdf global nodejs 14.18.2

asdf global python latest

asdf plugin add java
asdf install java openjdk-18
asdf install java liberica-jre-javafx-17.0.2+9
asdf global java liberica-jre-javafx-17.0.2+9

asdf plugin add golang
asdf install golang latest
asdf global golang latest

# installing ruby on m1 is crazyyy commented out now
# asdf plugin add ruby
# asdf install ruby 3.1.2
# asdf global ruby 3.1.2

asdf plugin add sqlite
asdf install sqlite latest
asdf global sqlite latest

asdf plugin add kubectl
asdf install kubectl latest
asdf global kubectl latest

ln -s $(realpath ~/SAPDevelop/dotfiles/.gitconfig) ~/.gitconfig

ln -s $(realpath ../.vimrc) ~/.vimrc
mkdir -p ~/.config/nvim
ln -s $(realpath ../.config/nvim/init.vim) ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm ~/.zshrc
ln -s $(realpath ../.zshrc) ~/.zshrc

wait
for extension in "activitywatch.aw-watcher-vscode" "apollographql.vscode-apollo" "arcanis.vscode-zipfs" "asvetliakov.snapshot-tools" "atlassian.atlascode" "bierner.markdown-mermaid" "dbaeumer.vscode-eslint" "eamodio.gitlens" "EditorConfig.EditorConfig" "esbenp.prettier-vscode" "flowtype.flow-for-vscode" "gamunu.vscode-yarn" "ilich8086.classic-asp" "Ionide.Ionide-fsharp" "jasonnutter.vscode-codeowners" "johnpapa.vscode-peacock" "letmaik.git-tree-compare" "ms-dotnettools.csharp" "ms-dotnettools.dotnet-interactive-vscode" "ms-dotnettools.vscode-dotnet-pack" "ms-dotnettools.vscode-dotnet-runtime" "ms-playwright.playwright" "ms-python.isort" "ms-python.python" "ms-python.vscode-pylance" "ms-toolsai.jupyter" "ms-toolsai.jupyter-keymap" "ms-toolsai.jupyter-renderers" "ms-toolsai.vscode-jupyter-cell-tags" "ms-toolsai.vscode-jupyter-slideshow" "ms-vscode.js-debug-nightly" "ms-vsliveshare.vsliveshare" "Orta.vscode-twoslash-queries" "redhat.java" "redhat.vscode-xml" "redhat.vscode-yaml" "streetsidesoftware.code-spell-checker" "tamasfe.even-better-toml" "teamchilla.blueprint" "tomoyukim.vscode-mermaid-editor" "unifiedjs.vscode-mdx" "VisualStudioExptTeam.intellicode-api-usage-examples" "VisualStudioExptTeam.vscodeintellicode" "vscjava.vscode-java-debug" "vscjava.vscode-java-dependency" "vscjava.vscode-java-pack" "vscjava.vscode-java-test" "vscjava.vscode-maven" "vscodevim.vim" "yoavbls.pretty-ts-errors" "yzhang.markdown-all-in-one"
# old: "activitywatch.aw-watcher-vscode" "apollographql.vscode-apollo" "arcanis.vscode-zipfs" "asvetliakov.snapshot-tools" "bierner.markdown-mermaid" "dbaeumer.vscode-eslint" "eamodio.gitlens" "EditorConfig.EditorConfig" "esbenp.prettier-vscode" "flowtype.flow-for-vscode" "gamunu.vscode-yarn" "jasonnutter.vscode-codeowners" "letmaik.git-tree-compare" "ms-python.python" "ms-python.vscode-pylance" "ms-toolsai.jupyter" "ms-toolsai.jupyter-keymap" "ms-toolsai.jupyter-renderers" "redhat.java" "redhat.vscode-xml" "redhat.vscode-yaml" "streetsidesoftware.code-spell-checker" "tamasfe.even-better-toml" "teamchilla.blueprint" "tomoyukim.vscode-mermaid-editor" "VisualStudioExptTeam.vscodeintellicode" "vscjava.vscode-java-debug" "vscjava.vscode-java-dependency" "vscjava.vscode-java-pack" "vscjava.vscode-java-test" "vscjava.vscode-maven" "vscodevim.vim" "yzhang.markdown-all-in-one"
do
  code --install-extension $extension --force 
done

pip install ntfy[telegram]


ln -s $(realpath ../.ntfy.yml) ~/.ntfy.yml
