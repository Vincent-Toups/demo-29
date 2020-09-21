FROM rocker/verse
ARG linux_user_pwd
MAINTAINER Vincent Toups <toups@email.unc.edu>
RUN echo Hello World
RUN R -e "install.packages('gridExtra')"
COPY lib/backpack_0.0.0.9000.tar.gz /backpack.tar.gz
RUN R -e "devtools::install_local('/backpack.tar.gz', update='never')"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
