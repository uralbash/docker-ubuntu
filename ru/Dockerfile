# ubuntu-ru
#
# VERSION               0.0.1
# vi: set ft=Dockerfile :
# vi: set nu :

FROM uralbash/docker-ubuntu:latest
MAINTAINER Dmitry Svintsov <root@uralbash.ru>

## Set LOCALE
RUN apt-get -qqy install language-pack-ru-base
RUN update-locale LANG=ru_RU.UTF-8
RUN echo "LANGUAGE=ru_RU.UTF-8" >> /etc/default/locale
RUN echo "LC_ALL=ru_RU.UTF-8" >> /etc/default/locale
