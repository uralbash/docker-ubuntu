#
# Makefile
# uralbash, 2016-02-17 13:14
#

all: build

build:
	docker build -t uralbash/ubuntu .

clean:
	docker rm uralbash/ubuntu

run:
	docker run -d --name uralbash_ubuntu_container \
		-i -t uralbash/ubuntu

# vim:ft=make
#
