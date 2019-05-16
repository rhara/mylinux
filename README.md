# myLinux

On cmder
```
docker run -tiP --name my_ubuntu myubuntu:0.1 bash
sudo /etc/init.d/ssh start
```

On MobaXterm
```
ssh -X -p $(docker port my_ubuntu 22 | cut -d: -f2) rhara@localhost
```
