# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby common-aliases)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export TERM=xterm-256color

export PATH="$HOME/bin:$PATH"
path+=("$HOME/.composer/vendor/bin")
export PATH

export PATH=~/.npm-global/bin:$PATH

if [ -d "/usr/local/java/jdk1.7.0_80" ] ; then
	export JAVA_HOME=/usr/local/java/jdk1.7.0_80
    export JDK_HOME=/usr/local/java/jdk1.7.0_80
    export PATH="/usr/local/java/jdk1.7.0_80/bin:$PATH"    
fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

. /etc/profile.d/vte.sh
