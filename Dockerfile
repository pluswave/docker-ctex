FROM debian:stretch
LABEL maintainer="zengbo.zhang@gmail.com"
LABEL description="out of box ctex package. \
docker run --rm -v $PWD:$PWD -w $PWD pluswave/ctex xelatex some-file.tex"
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y texlive-full
