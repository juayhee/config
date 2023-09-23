FROM amazonlinux:2

RUN yum update -y && \ 
    yum upgrade -y && \
    yum install -y git

# Do clone in home directory, scripts have problems dealing with starting at '/'
WORKDIR ~
