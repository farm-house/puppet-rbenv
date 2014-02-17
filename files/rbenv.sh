# Environment setup for rbenv
export RBENV_ROOT="/usr/local/rbenv"
export GEM_HOME="${RBENV_ROOT}/gems"

export PATH="${RBENV_ROOT}/bin:${GEM_HOME}/bin:${PATH}"

eval "$(rbenv init -)"
