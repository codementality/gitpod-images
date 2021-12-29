FROM gitpod/workspace-full:latest

### Google CLI for gcloud ###
USER root
RUN cd ~/; curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-367.0.0-linux-x86_64.tar.gz \
  && tar -xvzf google-cloud-sdk-367.0.0-linux-x86_64.tar.gz \
  && ./google-cloud-sdk/install.sh

### AWS CLI ###
USER root
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install

### Install Projector and PHPStorm ###
USER root
RUN install-packages python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6 telnet netcat
  # Install Projector
USER gitpod
RUN pip3 install projector-installer \
  # Install PhpStorm
  && mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance \
  && projector install 'PhpStorm 2021.1.4' --no-auto-run
USER root
COPY phpstorm /usr/local/bin/phpstorm

### Install DDEV ###
USER gitpod
RUN brew update && brew install drud/ddev/ddev && mkcert -install

USER gitpod
