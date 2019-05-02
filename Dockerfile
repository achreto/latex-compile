FROM ubuntu:18.04
MAINTAINER Reto Achermann <reto.achermann@inf.ethz.ch>


# install dependencies for puppet
RUN apt-get update && apt-get upgrade -y &&  \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
            wget \
            make \
            latexmk \
            git \
            apt-utils \
            texlive \
            texlive-base \
            texlive-latex-base \
            texlive-latex-recommended \
            texlive-latex-extra \
            texlive-fonts-recommended \
            texlive-fonts-extra \
            texlive-lang-german \
            texlive-lang-english \
            texlive-publishers \
            texlive-science \
            texlive-pstricks \
            texlive-pictures \
            biber \
            pandoc \
            librsvg2-bin \
            python3 \
            python3-matplotlib \
            python3-numpy \
            gnuplot
