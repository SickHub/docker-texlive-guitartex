# [Docker image: texlive-guitartex](https://hub.docker.com/r/drpsychick/texlive-guitartex/)

[![DockerHub build status](https://img.shields.io/docker/build/drpsychick/texlive-guitartex.svg)](https://hub.docker.com/r/drpsychick/texlive-guitartex/builds/) [![DockerHub build](https://img.shields.io/docker/automated/drpsychick/texlive-guitartex.svg)](https://hub.docker.com/r/drpsychick/texlive-guitartex/)

Minimal texlive alpine image including guitartex (gtx2tex)

* https://hub.docker.com/r/drpsychick/texlive-guitartex/
* based on https://github.com/phipsgabler/docker-texlive-minimal
* adds guitartex https://sourceforge.net/projects/guitartex/

## Convert gtx to pdf
docker run -it --rm -v $PWD:/data drpsychick/texlive-guitartex gtx2tex --output=pdf /data/mysong.gtx

## Issues
* [ ] thumbpdf throws errors with Ghostscript
