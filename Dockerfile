FROM debian:jessie
LABEL maintainer="zengbo.zhang@gmail.com"
LABEL description="out of box ctex package. \
docker run --rm -v $PWD:$PWD -w $PWD pluswave/ctex xelatex some-file.tex"
RUN apt-get update
RUN apt-get install -y texlive-full
RUN apt-get install -y fonts-droid
RUN apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-wqy-microhei ttf-wqy-microhei
RUN sed -i -e "s/SimHei/WenQuanYi Micro Hei/g" -e "s/SimSun/AR PL UMing CN/g" -e "s/\[SIMKAI.TTF\]/AR PL UKai CN/g" \
       -e "s/\[SIMFANG.TTF\]/WenQuanYi Micro Hei Mono/g" \
       /usr/share/texlive/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def
