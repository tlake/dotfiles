################################
# just for fun
################################

alias fucking='sudo'


################################
# shell
################################

alias ..="cd .."
alias l='ls -CFG'
alias lt='l -ahlt'
alias ll='l -alF'
alias la='l -A'


################################
# save me from my own stupidity
################################

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"


################################
# apt-get
################################

alias sag='sudo apt-get'
alias sagi='sag install'
alias sagud='sag update'
alias sagug='sag upgrade'
alias sagdug='sag dist-upgrade'
alias sagyug='sag -y upgrade'
alias sagydug='sag -y dist-upgrade'

# the full update/upgrade suite:
alias sagfu='sagud ; sagyug ; sagydug'

alias sagac='sag autoclean'
alias sagc='sag clean'
alias sagar='sag autoremove'
alias sagyac='sag -y autoclean'
alias sagyc='sag -y clean'
alias sagyar='sag -y autoremove'

# the full clean-up suite:
alias sagfc='sagyac ; sagyc ; sagyar'

# the full monty:
alias sagfm='sagfu ; sagfc'


################################
# git
################################

# checking out
alias gk='git checkout'

# cloning
alias gcl="git clone"

# status
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gba='gb -a'

# fetching
alias gf='git fetch'
alias gfa='gf --all'

# pulling
alias gl='git pull'
alias glo='gl origin'
alias glom='glo master'

# adding
alias ga='git add'
alias gaa='ga -A'

# committing
alias gc='git commit'
alias gcm='gc -m'

# pushing
alias gp='git push'
alias gpo='gp origin'
alias gpom='gpo master'

# rebasing
alias grb='git rebase'

# resetting
alias gr='git reset'
alias grh='gr --hard'
alias grhom='grh origin/master'
alias grhod='grh origin/dev'

# single command to reset current repo to origin/master
alias grm='gfa && grhom'

# single command to do the same for origin/dev
alias grd='gfa && grhod'


################################
# heroku
################################

alias gph='git push heroku'
alias gphm='gph master'


################################
# python
################################

alias act="source env/bin/activate"
alias dac="deactivate"
alias fpyc="find . -name '__pycache__' -print ; find . -name '*.pyc' -print"
alias rmpyc="find . -name '__pycache__' -delete -print ; find . -name '*.pyc' -delete -print"


################################
# django
################################

# create new heroku-ready django project
#
# -make sure virtualenv has already been run;
# -make sure activated in that env;
# -supply name of project after alias;
# -supply a period to create in wd

alias newdjhere='django-admin startproject --template=https://github.com/heroku/heroku-django-template/archive/master.zip --name=Procfile'

# for a django project, this alias is a shortcut to executing
# my three most prevalent commands to start a local server
#
# -make sure that manage.py has been chmod +x

alias localserver='./manage.py syncdb && ./manage.py collectstatic --noinput && foreman start'


################################
# sublime
################################
#Function to deal with the annoying sublime errors
#Send annoying .output logs to /dev/null
function sblm
{
    nohup sublime $1 >/dev/null 2>&1 &
}

#Call my sublime function
alias sublime="sblm"


################################
# xiwi (for ubuntu-within-chrome)
################################

alias x="xiwi -f -T"

alias nx="nohup xiwi -f -T"

function nohup_wrapper
{
    nohup "$@" &>/dev/null &
}

alias nwx="nohup_wrapper"


################################
# pip
################################

alias pipi="pip install"
alias pipir="pipi -r"
alias pipreq="pipir requirements.txt"
alias pipip="pipi -U pip setuptools"
alias pipf="pip freeze"
alias pipfreq="pipf > requirements.txt"


################################
# kerberos
################################

alias kk="kinit TLake@INTERNAL.IMSGLOBAL.COM"
alias kl="kinit -l 120h TLake@INTERNAL.IMSGLOBAL.COM"


################################
# keybase
################################

alias kb="keybase"


################################
# layer0
################################

alias l0env="echo '>>> exporting env vars for tlakedev layer0'; eval $(l0-setup endpoint -di tlakedev)"
alias l0envskipssl='export LAYER0_SKIP_VERSION_VERIFY="1" ; l0env'


################################
# pianobar + tmux
################################

alias pbsend="tmux send-keys -t pianobar"
alias pbp="pbsend ' '"
alias pbtu="pbsend '+'"
alias pbtd="pbsend '-'"
alias pbvu="pbsend ')'"
alias pbvd="pbsend '('"
alias pbvr="pbsend '^'"
alias pbn="pbsend 'n'"

