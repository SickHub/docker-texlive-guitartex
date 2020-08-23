# [Docker image: texlive-guitartex](https://hub.docker.com/r/drpsychick/texlive-guitartex/)

[![Docker image](https://img.shields.io/docker/image-size/drpsychick/texlive-guitartex?sort=date)](https://hub.docker.com/r/drpsychick/texlive-guitartex/tags)
[![Travis CI](https://img.shields.io/travis/com/DrPsychick/docker-texlive-guitartex)](https://travis-ci.com/github/DrPsychick/docker-texlive-guitartex)
[![DockerHub pulls](https://img.shields.io/docker/pulls/drpsychick/texlive-guitartex.svg)](https://hub.docker.com/r/drpsychick/texlive-guitartex/)
[![DockerHub stars](https://img.shields.io/docker/stars/drpsychick/texlive-guitartex.svg)](https://hub.docker.com/r/drpsychick/texlive-guitartex/)
[![GitHub stars](https://img.shields.io/github/stars/drpsychick/docker-texlive-guitartex.svg)](https://github.com/drpsychick/docker-texlive-guitartex)

Minimal texlive alpine image including guitartex (gtx2tex)

* https://hub.docker.com/r/drpsychick/texlive-guitartex/
* based on https://github.com/phipsgabler/docker-texlive-minimal
* adds guitartex https://sourceforge.net/projects/guitartex/

## Create default .guitartexrc
if you don't have one:

`docker run -it --rm -v $PWD:/data drpsychick/texlive-guitartex cp /guitartex.conf /data/.guitartexrc`

## Convert gtx to pdf
`docker run -it --rm -v $PWD:/data drpsychick/texlive-guitartex gtx2tex --output=pdf /data/mysong.gtx`

## Issues
* [ ] thumbpdf throws errors with Ghostscript
