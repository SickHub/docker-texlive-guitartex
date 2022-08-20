ARG ALPINE_VERSION=latest
FROM drpsychick/texlive-pdflatex:$ALPINE_VERSION

ENV PATH=/usr/local/texlive/bin/x86_64-linux:/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

RUN apk --no-cache add ghostscript

RUN wget https://netcologne.dl.sourceforge.net/project/guitartex/GuitarTeX/GuitarTeX-2.8.2/guitartex-2.8.2-fix1.tar.gz && \
    tar xzf guitartex-2.8.2-fix1.tar.gz && \
    # fix shell and input encoding = utf8
    sed -i -e 's#/bin/bash#/bin/sh#' guitartex-2.8.2/install.sh && \
    sed -i -e 's/latin1/utf8/' guitartex-2.8.2/gtx2tex.pl && \
    (cd guitartex-2.8.2; ./install.sh) && \
    mkdir -p /root/texmf/tex/latex/local/ && \
    cp -r guitartex-2.8.2/.TeX/gchords.sty /root/texmf/tex/latex/local/ && \
    chmod go+r /root/texmf/tex/latex/local/* && \
    cp guitartex-2.8.2/guitartex.conf /root/.guitartexrc && \
    rm -rf guitartex-2.8.2* && \
    texhash

#RUN sed -i -e 's#thumbpdf $outfilename#thumbpdf $outfilename.pdf#' /usr/local/bin/gtx2tex

# mount your .gtx files here, including .guitartexrc
VOLUME ["/data"]
WORKDIR /data

CMD ["gtx2tex"]
