# handy aliases for working with the docker file
# and doing other stuff

source secrets.sh

alias bu='docker build . -t demo-29 --build-arg linux_user_pwd=$SECRET_PWD'
alias hc='docker run -p 8711:8000 -v `pwd`:/host -it demo-29 hovercraft /host/slides.rst'
alias hcb='docker run -v `pwd`:/host -it demo-29 hovercraft /host/slides.rst /host/html_presentation'

alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it demo-29 sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias rss='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -p 8787:8787 -t demo-29'
alias b='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it demo-29 sudo -H -u rstudio /bin/bash'
