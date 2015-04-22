# docker-ubuntu
Docker Ubuntu with a human face for Vagrant docker provider and make your dev environment. Contains a lot of different useful things, reminding your environment for development.

Here are a few charms:

* bash-completion
* wget curl telnet tmux git vim man tree
* python-pip python-dev python3.4-dev
* Pillow ipython ipdb virtualenvwrapper
* libpq-dev
* User ``vagrant`` with password ``123``
* openssh-serever for you Vagrant project (work with ``vagrant ssh`` command``)
* Github + BitBucket in known_hosts
* autocomplete command from history by PgUP & PgDOWN
* powerline
* for ``uralbash/docker-ubuntu-ru`` RU locale
* etc...

This is really a good choice for development projects and your custom Dockerfile.

# Base Docker Image

[ubuntu:14.10](https://registry.hub.docker.com/u/library/ubuntu/)

# Installation

* From Docker Hub ``docker pull uralbash/docker-ubuntu`` or ``docker pull uralbash/docker-ubuntu-ru`` for Ru locale.
* From GitHub ``docker build -t="uralbash/docker-ubuntu" github.com/uralbash/docker-ubuntu``

# Usage

### Run container

``docker run -d --name foobar uralbash/docker-ubuntu``

### Connect

``docker exec -i -t foobar bash``

### And go to vagrant user

```bash
root@fbcf87832836:/# su - vagrant
```

and see:

![screen](https://raw.githubusercontent.com/ITCase/docker-ubuntu/master/ubuntu.png)
