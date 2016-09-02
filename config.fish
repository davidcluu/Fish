###############
# Login Shell #
###############

function boat
  echo -e ""
  echo -e "\e[38;5;94m               |    |    |\e[38;5;256m"
  echo -e "\e[38;5;230m              )_)  )_)  )_)"
  echo -e "\e[38;5;230m             )___))___))___)\e[38;5;256m\\"
  echo -e "\e[38;5;230m            )____)____)_____)\e[38;5;256m\\\\\\\\"
  echo -e "          \e[38;5;94m_____|\e[38;5;94m____|\e[38;5;94m____|\e[38;5;94m____\e[38;5;256m\\\\\\\\\\\\\e[38;5;94m__"
  echo -e " \\e[38;5;87m---------\e[38;5;94m\\                   /\e[38;5;87m---------"
  echo -e "   ^^^^^ ^^^^^^^^^^^^^^^^^^^^^"
  echo -e "     ^^^^      ^^^^     ^^^    ^^"
  echo -e "          ^^^^      ^^^"
  echo -e ""
end

if status --is-login
  boat
end


#######################
# Directory Shortcuts #
#######################

# Directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias -='cd -'

# ls
alias lsa='ls -al'
alias lsd='ls -l | grep "^d"'

# Git
alias git-cloc='git ls-files | xargs cloc'
aluas git-push-all='git remote | xargs -L1 git push --all'

# Specific directories
function cdprog
  if count $argv > /dev/null
    cd /Users/davidluu/Documents/_Programming/$argv
  else
    cd /Users/davidluu/Documents/_Programming
  end
end


###########
# Exports #
###########

export JAVA_HOME=(/usr/libexec/java_home)


############
# Database #
############

function startPostgres
  postgres -D /usr/local/var/postgres
end
