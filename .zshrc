# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~HOME/.npm-global/bin:~HOME/Development/Flutter/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias cat="bat"

timer() {
    let "mins = $1 * 60" 
    echo $mins
    sleep $mins && osascript -e 'display notification "Times up" sound name "Ping"'
}
# works only with floating point numbers (percentage 79.0 100.0)
percentage() {
    if [[ $1 = "" ]]
    then
        echo "Ex. Usage: percentage 79.0 100.0"
    else
        let "percentage = $1 / $2 * 100" 
        echo $percentage
    fi
}
