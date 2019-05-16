# myLinux

### Instructions

On cmder
```
$ docker run -dP --privileged --name my_ubuntu myubuntu:0.1 /sbin/init (Ubuntu)
$ docker run -dP --privileged --name my_centos mycentos:0.1 /sbin/init (CentOS)
$ docker exec -ti my_ubuntu bash
```

In the container,
```
# /etc/init.d/ssh start (Ubuntu)
# systemctl start sshd.service (CentOS)
```

You can now detach this container.

From another terminal (or from MobaXterm on Windows), ssh login to the container;

```
$ ssh -X -p $(docker port my_ubuntu 22 | cut -d: -f2) rhara@localhost (Ubuntu)
$ ssh -X -p $(docker port my_centos 22 | cut -d: -f2) rhara@localhost (CentOS)
```

Then, the terminal is X-enabled!!
