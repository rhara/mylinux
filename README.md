# myLinux

### Instructions

On cmder
```
$ docker run -dP --privileged --name my_ubuntu myubuntu:0.1 /sbin/init
$ docker exec -ti my_ubuntu bash
```

In the container,
```
# /etc/init.d/ssh start
```

You can now detach this container.

From another terminal (or from MobaXterm on Windows), ssh login to the container;

```
$ ssh -X -p $(docker port my_ubuntu 22 | cut -d: -f2) rhara@localhost
```

Then, the terminal is X-enabled!!
