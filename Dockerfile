# healthdesk
#
# VERSION               0.0.1
# vi: set ft=Dockerfile :

FROM ubuntu:14.10
MAINTAINER Dmitry Svintsov <root@uralbash.ru>

ENV HOME_USER vagrant
ENV HOME_PASS 123

## Main pakages
RUN apt-get -qq update
RUN apt-get -qqy install postgresql-client-9.4 libpq-dev
RUN apt-get -qqy install bash-completion
RUN apt-get -qqy install wget telnet tmux git vim man
RUN apt-get -qqy install python-pip python-dev python3.4-dev

## Python
RUN pip install pip virtualenv virtualenvwrapper -U

## Add USER
RUN useradd -m -s /bin/bash ${HOME_USER} && \
    echo "${HOME_USER}:${HOME_PASS}"|chpasswd && \
    adduser ${HOME_USER} sudo && \
    echo ${HOME_USER}' ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## SSH
RUN apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER ${HOME_USER}

## Bash
RUN sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" $HOME/.bashrc
RUN echo "" >> $HOME/.bashrc
RUN echo "export EDITOR=vim" >> $HOME/.bashrc
RUN echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $HOME/.bashrc
RUN echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $HOME/.bashrc

# autocomplete command from history by PgUP & PgDOWN
RUN echo "" >> $HOME/.inputrc
RUN echo '"\e[5~": history-search-backward' >> $HOME/.inputrc
RUN echo '"\e[6~": history-search-forward' >> $HOME/.inputrc

# powerline
RUN pip install --user git+git://github.com/Lokaltog/powerline
RUN echo "" >> $HOME/.bashrc
RUN echo 'if [ -d "$HOME/.local/bin" ]; then' >> $HOME/.bashrc
RUN echo '    PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
RUN echo 'fi' >> $HOME/.bashrc

RUN echo "" >> $HOME/.bashrc
RUN echo 'if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then' >> $HOME/.bashrc
RUN echo '    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh' >> $HOME/.bashrc
RUN echo 'fi' >> $HOME/.bashrc

## Install an SSH for Vagrant
RUN mkdir -pm 700 $HOME/.ssh && \
    wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O $HOME/.ssh/authorized_keys

USER root

## Run sshd
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
