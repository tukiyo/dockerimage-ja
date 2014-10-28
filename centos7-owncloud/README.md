# usage

    docker run --privileged -it -d -p 8080:80 --name owncloud7 tukiyo3/centos7-owncloud
    docker exec -it owncloud7 bash
    mysqladmin -uroot create owncloud

# info 

* access http://docker-ip:8080/owncloud

mysql
=====

 * dbuser => root
 * dbpass => (nopassword)
 * dbname => owncloud
 * dbserver => localhost

* [ownCloud7 install](http://qiita.com/tukiyo3/items/faf4dc185e5a95f7f3de)

![owncloud.png](https://qiita-image-store.s3.amazonaws.com/0/25728/51d7a185-0494-b5e6-10ca-24762bb86e0c.png)
