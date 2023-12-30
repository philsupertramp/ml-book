FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND="nointeraction" apt-get -y install texlive-latex-extra texlive-science texlive-fonts-extra \
  texlive-xetex texlive-plain-generic \
  texlive-font-utils texlive-lang-german texlive-bibtex-extra inkscape biber 
RUN DEBIAN_FRONTEND="nointeraction" apt-get -y install wget
RUN wget https://mirrors.ctan.org/macros/latex/contrib/IEEEtran.zip
RUN mkdir -p /opt/ieeetran && unzip IEEEtran.zip -d /opt/ieeetran


RUN mkdir -p /usr/app

WORKDIR /usr/app

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "bash", "/usr/app/entrypoint.sh" ]

