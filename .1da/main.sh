# path
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# proxy
# export https_proxy=http://127.0.0.1:7890
# export http_proxy=http://127.0.0.1:7890
# export all_proxy=socks5://127.0.0.1:7890

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# alias
alias vf="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias vfa="fd --type f --hidden . ~/ | fzf-tmux -p --reverse | xargs nvim"
alias vd="fd --type d -d 1 . ~/Codes/echoingtech | fzf-tmux -p --reverse | xargs nvim"
alias vda="fd --type d --hidden . ~/ | fzf-tmux -p --reverse | xargs nvim"

alias python="python3"
alias nr="npm run"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias k=kubectl

