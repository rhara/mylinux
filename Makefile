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
	NN=$$(docker ps -qa) ; \
	if [ -n "$$NN" ] ; then \
		docker rm -f $$NN ; \
	fi
	NN=$$(docker images | grep '<none>' | awk '{print $$3}') ; \
	if [ -n "$$NN" ] ; then \
		docker rmi $$NN ; \
	fi
