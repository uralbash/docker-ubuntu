# docker-ubuntu
Docker Ubuntu with a human face for Vagrant docker prover and make your dev environment.

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


