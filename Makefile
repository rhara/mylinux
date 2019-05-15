build:
	docker build -t myubuntu:0.1 .

# run:
# 	docker run -d -P --name my_ubuntu myubuntu:0.1
# 	ssh -X -p $$(docker port my_ubuntu 22 | cut -d: -f2) root@localhost

run_user:
	docker run -P --name my_ubuntu myubuntu:0.1 bash
	# $ docker run -P --name my_ubuntu myubuntu:0.1 bash
	# In the container,
	# $ sudo /etc/init.d/ssh start
	# From another terminal,
	# $ ssh -X -p $$(docker port my_ubuntu 22 | cut -d: -f2) localhost
	# This terminal is X-enabled!!

clean:
	docker rm -f $$(docker ps -qa) || exit 0
	docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
