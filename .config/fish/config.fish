#function fish_prompt
#        /Users/Psidium/Documents/random/powerline-shell/powerline-shell.py $status --shell bare ^~/Documents/output-powerline-shell.log
#end
#

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
powerline-daemon -q

set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"

alias tvim "mvim --remote-tab-silent"

powerline-setup

eval (docker-machine env default)

set -x GOPATH $HOME/go-files

set -x ANT_HOME /usr/local/opt/ant
set -x MAVEN_HOME /usr/local/opt/maven
set -x GRADLE_HOME /usr/local/opt/gradle
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x ANDROID_NDK_HOME /usr/local/opt/android-ndk

set -x PATH $ANT_HOME/bin $PATH
set -x PATH $MAVEN_HOME/bin $PATH
set -x PATH $GRADLE_HOME/bin $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH
set -x PATH $ANDROID_HOME/build-tools/(ls $ANDROID_HOME/build-tools | sort | tail -1) $PATH


fish_vi_key_bindings

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
