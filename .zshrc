# Oh My Zsh
ZSH_DISABLE_COMPFIX=true
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git z)
source $ZSH/oh-my-zsh.sh

# Aliases
alias cat='bat'

# Print out the latest log from Cloudwatch for a log group
# e.g. For Lambda: alog "/aws/lambda/AdieuAPIStack-EmailsHandlerC69F2C27-OQYE2R1AK0SI"
function alog {
  LOG_GROUP=$1
  aws logs get-log-events --log-group-name $LOG_GROUP --log-stream-name `aws logs describe-log-streams --log-group-name $LOG_GROUP --max-items 1 --order-by LastEventTime --descending --query 'logStreams[].logStreamName' --output text | head -n 1` --query 'events[].message' --output text
}

# NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Jabba
export JABBA_HOME=~/.jabba
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"
export PATH="/usr/local/opt/ruby/bin:$PATH"
