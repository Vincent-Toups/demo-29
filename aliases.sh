# handy aliases for working with the docker file
# and doing other stuff

source secrets.sh

alias bu='docker build . -t demo-29 --build-arg linux_user_pwd=$SECRET_PWD'

alias r='docker run  -v $(readlink -f ./faux-containers):/mnt/containers  -v $(readlink -f ../bacpac-backpack/):/bacpac-backpack -v `pwd`:/home/rstudio  -e PASSWORD=$SECRET_PWD  -it demo-29 sudo  -H  -u rstudio /bin/bash  -c "cd ~/; R"'
alias rss='docker run  -v $(readlink -f ./faux-containers):/mnt/containers  -v $(readlink -f ../bacpac-backpack/):/bacpac-backpack -v `pwd`:/home/rstudio  -e PASSWORD=$SECRET_PWD  -p 8787:8787  -t demo-29'
alias b='docker run  -v $(readlink -f ./faux-containers):/mnt/containers  -v `pwd`:/home/rstudio  -v $(readlink -f ../bacpac-backpack/):/bacpac-backpack -e PASSWORD=$SECRET_PWD  -it demo-29 sudo  -H  -u rstudio /bin/bash'
