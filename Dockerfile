FROM gitpod/workspace-full:latest

### Google CLI for gcloud ###
USER gitpod
RUN curl https://sdk.cloud.google.com > install.sh \
  && bash install.sh --disable-prompts

### AWS CLI ###
USER gitpod
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install

### Install DDEV ###
USER gitpod
RUN brew update && brew install drud/ddev/ddev && mkcert -install

USER gitpod
