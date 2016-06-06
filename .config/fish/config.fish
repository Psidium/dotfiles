#function fish_prompt
#        /Users/Psidium/Documents/random/powerline-shell/powerline-shell.py $status --shell bare ^~/Documents/output-powerline-shell.log
#end
#
#
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x GOPATH ~/gopath


powerline-daemon -q

set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"

powerline-setup

alias tvim "mvim --remote-tab-silent"

eval (docker-machine env default)

set -x ENV_ROOT /usr/local/var/jenv
set -x PATH /usr/local/opt/go/libexec/bin $GOPATH/bin $HOME/.jenv/bin /usr/local/xsaclient/bin $PATH

ssh_agent_start
echo "Don't forget to run ssh-add ~/.ssh/githubSAP if you are using ssh"

