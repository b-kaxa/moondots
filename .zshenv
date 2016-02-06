# require this file only once

typeset -U path

path=(
  /bin(N-/)
  /sbin(N-/)
  /usr/bin(N-/)
  /usr/sbin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /opt/php/bin(N-/)
  
  # for heroku
  /usr/local/heroku/bin(N-/)

  # for haskell
  ~/.cabal/bin(N-/)
  ~/Library/Haskell/bin(N-/)
  ~/Library/Haskell/bin/alex(N-/)
)
