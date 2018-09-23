FROM phipsgabler/texlive-minimal

ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

RUN tlmgr update --self && \
    tlmgr install collection-latex collection-fontsrecommended thumbpdf

RUN wget https://netcologne.dl.sourceforge.net/project/guitartex/GuitarTeX/GuitarTeX-2.8.2/guitartex-2.8.2-fix1.tar.gz && \
    tar xzf guitartex-2.8.2-fix1.tar.gz && \
    # fix shell and input encoding = utf8
    sed -i -e 's#/bin/bash#/bin/sh#' guitartex-2.8.2/install.sh && \
    sed -i -e 's/latin1/utf8/' guitartex-2.8.2/gtx2tex.pl && \
    (cd guitartex-2.8.2; ./install.sh) && \
    cp guitartex-2.8.2/guitartex.conf / && \
    rm -rf guitartex-2.8.2*

# mount your .gtx files here, including .guitartexrc
VOLUME ["/data"]

CMD ["gtx2tex"]
