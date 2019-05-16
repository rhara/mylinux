build-ubuntu:
	docker build -t myubuntu:0.1 -f Dockerfile-ubuntu-18.04 .

build-centos:
	docker build -t mycentos:0.1 -f Dockerfile-centos-7 .

run-ubuntu:
	docker run -dP --privileged --name my_ubuntu myubuntu:0.1 /sbin/init
	docker exec -ti my_ubuntu bash
	# In the container,
    # # /etc/init.d/ssh start
	# From another terminal.
	# $ ssh -X -p $(docker port my_ubuntu 22 | cut -d: -f2) rhara@localhost
	# Then, the terminal is X-enabled!!

# ** DEPRECATED **
	# docker run -tiP --name my_ubuntu myubuntu:0.1 bash
	# $ docker run -P --name my_ubuntu myubuntu:0.1 bash
	# In the container,
	# $ sudo /etc/init.d/ssh start
	# From another terminal,
	# $ ssh -X -p $$(docker port my_ubuntu 22 | cut -d: -f2) localhost
	# This terminal is X-enabled!!


run-centos:
	docker run -dP --privileged --name my_centos mycentos:0.1 /sbin/init
	# docker exec -ti my_centos bash
	# In the container,
	# # systemctl start sshd.service
	# From another terminal,
	# check the port number
	# $ docker port my_centos
	# ssh -X -p <#port> rhara@localhost
	# This terminal is X-enabled!!


clean:
	docker rm -f $$(docker ps -qa) || exit 0
	docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
