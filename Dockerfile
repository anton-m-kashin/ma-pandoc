FROM debian:10

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    texlive-latex-base \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    latexmk \
    fontconfig \
    lmodern \
    git \
    curl \
    make \
    python3 \
    python3-pip \
    librsvg2-bin

RUN pip3 install -U matplotlib pygments

RUN mkdir /install

RUN curl \
    -L \
    -o /install/pandoc.deb \
    https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb

RUN git clone \
    --depth 1 \
    https://github.com/pandoc/lua-filters /install/lua-filters

RUN git clone \
    --depth 1 \
    https://github.com/adobe-fonts/source-code-pro /install/source-code-pro

RUN curl \
    -L \
    -o /install/dejavu-fonts-ttf-2.37.tar.bz \
    https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.tar.bz2
RUN tar -xf /install/dejavu-fonts-ttf-2.37.tar.bz -C /install/

RUN dpkg -i /install/pandoc.deb
RUN mkdir -p ~/.local/share/pandoc/filters
RUN cp /install/lua-filters/*/**.lua ~/.local/share/pandoc/filters
RUN cp /install/source-code-pro/TTF/* /usr/share/fonts
RUN cp /install/dejavu-fonts-ttf-2.37/ttf/* /usr/share/fonts
RUN fc-cache

RUN rm -rf /install

WORKDIR /documents
