# Docker image of SoftEther VPN

This will deploy a fully functional [SoftEther VPN](https://www.softether.org) server as a docker image.

Available on [Docker Hub](https://hub.docker.com/r/romantix74/ethervpn).

## Download

    docker pull romantix74/ethervpn

## Run


Simplest version:

    docker run -d --net host --cap-add NET_ADMIN --name softether romantix74/ethervpn

Config file can be mounted::

    touch /etc/vpnserver/vpn_server.config
    docker run -d -v /etc/vpnserver/vpn_server.config:/usr/local/vpnserver/vpn_server.config --net host --cap-add NET_ADMIN --name softether romantix74/ethervpn

Keep the logs:

    docker volume create --name softether-logs
    docker run -d --net host --cap-add NET_ADMIN --name softether -v softether-logs:/var/log/vpnserver romantix74/ethervpn

I prefer using [docker-compose](https://github.com/romantix74/ethervpn/blob/master/docker-compose.yml)
