# Pritunl + Docker = <3

## Pull the image

    docker pull pthomson/pritunl:1.3

## Data Volume

    mkdir -p /mnt/docker-pritunl/var/lib/mongodb

## Run Pritunl

    docker run -d --privileged \
        -v /mnt/docker-pritunl/var/lib/mongodb:/var/lib/mongodb \
        -p 1194:1194/udp \
        -p 1194:1194/tcp \
        -p 9700:9700/tcp \
        pthomson/pritunl:1.3

## Configure Pritunl

* Open https://<youripaddress:9700
* Login with username pritunl and password pritunl

