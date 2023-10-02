# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
path=('/usr/local/bin' '/opt/homebrew/bin' '/opt/homebrew/opt/curl/bin' '/usr/local/opt/curl/bin' $HOME/bin $path)
export PATH

local ME=$(whoami)
# Path to your oh-my-zsh installation.
export ZSH="/Users/$ME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	command-not-found
	gitignore
	grunt
	gulp
	jira
	npm
	yarn
	node
	nvm
	macos
	pip
	vscode
	zsh-autosuggestions
    asdf
    z
    zsh-syntax-highlighting
    zsh-history-substring-search
	)
zstyle ':completion:*' use-cache yes

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

export NODE_EXTRA_CA_CERTS=$(echo $HOME/SAPDevelop/concur/deployment/conf/pp-53cokahklcpz/ca.crt.pem)

#change color of autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=242
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# export AUTO_NTFY_DONE_IGNORE="ntfy emacs htop info less mail man meld most mutt nano screen ssh tail tmux top vi vim nvim watch"
# export AUTO_NTFY_DONE_LONGER_THAN=-L20
# export AUTO_NTFY_DONE_UNFOCUSED_ONLY=-b
# eval "$(ntfy shell-integration)"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias gti=git

eval $(thefuck --alias)

export JIRA_URL="https://jira.concur.com"

function integration() {
   SAP_USER=i849964 /Users/psidium/SAPDevelop/svpn-sso/svpn-login.py --oktaUser=gabriel.borges access-devtest.concursolutions.com
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ ! -f ~/.zshprivate ]] || source ~/.zshprivate
