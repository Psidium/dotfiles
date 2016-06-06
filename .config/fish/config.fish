#function fish_prompt
#        /Users/Psidium/Documents/random/powerline-shell/powerline-shell.py $status --shell bare ^~/Documents/output-powerline-shell.log
#end
#
#
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
powerline-daemon -q

set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"

alias tvim "mvim --remote-tab-silent"

powerline-setup

eval (docker-machine env default)

set -x GOPATH $HOME/go-files

fish_vi_mode

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
