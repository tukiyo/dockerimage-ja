```
docker run -it -d --name dev -h dev.local tukiyo3/ubuntu-dev
docker logs dev
```

```
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant
mv vagrant ~/.ssh/id_rsa.vagrant
chmod 600 ~/.ssh/id_rsa.vagrant
```

write ~/.ssh/config

```
Host dev 
    User vagrant
    HostName dev.local
    IdentityFile ~/.ssh/id_rsa.vagrant
```

```
ssh dev
```
