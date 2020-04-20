FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]
ENV ID=ubuntu
ENV VERSION_ID=18.04
RUN apt-get update && apt-get -y install curl unzip python3 python3-venv docker.io gnupg2
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && unzip awscli-bundle.zip
RUN /usr/bin/python3 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN aws --version

RUN echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${ID^}_${VERSION_ID}/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
RUN curl -s https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${ID^}_${VERSION_ID}/Release.key | apt-key add -
RUN apt-get update -qq && apt-get -qq -y install buildah
