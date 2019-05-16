build-ubuntu:
	docker build -t myubuntu:0.1 -f Dockerfile-ubuntu-18.04 .


build-centos:
	docker build -t mycentos:0.1 -f Dockerfile-centos-7 .


run-ubuntu:
	docker run -dP --privileged --name my_ubuntu myubuntu:0.1 /sbin/init
	docker exec -ti my_ubuntu bash


run-centos:
	docker run -dP --privileged --name my_centos mycentos:0.1 /sbin/init
	docker exec -ti my_centos bash


clean:
	docker rm -f $$(docker ps -qa) || exit 0
	docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
