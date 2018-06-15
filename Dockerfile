FROM ubuntu:latest

ARG GDC_CLIENT_ZIP=https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.3.0_Ubuntu14.04_x64.zip

RUN apt-get update -qq
RUN apt-get install -y \
  wget zip unzip

RUN wget -q ${GDC_CLIENT_ZIP}
RUN unzip `basename ${GDC_CLIENT_ZIP}`
RUN mv ./gdc-client /usr/local/bin

RUN mkdir -p /ws

CMD []
ENTRYPOINT ["gdc-client"]