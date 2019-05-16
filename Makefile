build-ubuntu:
	docker build -t myubuntu:0.1 -f Dockerfile-ubuntu-18.04 .

build-centos:
	docker build -t mycentos:0.1 -f Dockerfile-centos-7 .

run-ubuntu:
	docker run -tiP --name my_ubuntu myubuntu:0.1 bash
	# $ docker run -P --name my_ubuntu myubuntu:0.1 bash
	# In the container,
	# $ sudo /etc/init.d/ssh start
	# From another terminal,
	# $ ssh -X -p $$(docker port my_ubuntu 22 | cut -d: -f2) localhost
	# This terminal is X-enabled!!

run-centos:
	docker run -tiP --name my_centos mycentos:0.1 bash

clean:
	docker rm -f $$(docker ps -qa) || exit 0
	docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
