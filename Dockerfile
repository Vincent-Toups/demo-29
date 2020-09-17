FROM rocker/verse
ARG linux_user_pwd
MAINTAINER Vincent Toups <toups@email.unc.edu>
RUN echo Hello World
RUN R -e "install.packages('gridExtra')"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
