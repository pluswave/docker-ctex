FROM debian:jessie
LABEL maintainer="zengbo.zhang@gmail.com"
LABEL description="out of box ctex package. \
docker run --rm -v $PWD:$PWD -w $PWD pluswave/ctex xelatex some-file.tex"
RUN echo \
    deb http://httpredir.debian.org/debian jessie-backports main contrib non-free \
    > /etc/apt/sources.list.d/backports.list
RUN apt-get update
RUN apt-get install -y texlive-full
RUN apt-get install -y -t jessie-backports fonts-noto-cjk
RUN apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-wqy-microhei ttf-wqy-microhei
RUN cp /usr/share/texlive/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def ctex-xecjk-winfongs.def
RUN sed -i -e "s/SimHei/Noto Sans CJK SC/g" -e "s/SimSun/AR PL UMing CN/g" -e "s/\[SIMKAI.TTF\]/AR PL UKai CN/g" \
       -e "s/\[SIMFANG.TTF\]/Noto Sans Mono CJK SC/g" \
       /usr/share/texlive/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def
