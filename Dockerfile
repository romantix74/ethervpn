# SoftEther VPN server

FROM debian:10
MAINTAINER Roman Alekseev <romantix74@yandex.ru>

ENV VERSION v4.34-9745-rtm-2020.04.05
#ENV VERSION v4.34-9744-beta-2020.03.20
#ENV VERSION v4.32-9731-beta-2020.01.01
#ENV VERSION v4.31-9727-beta-2019.11.18

WORKDIR /usr/local/vpnserver

RUN apt-get update &&\
        apt-get -y -q install iptables gcc make wget net-tools && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
        wget http://www.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz &&\		
        tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
        rm /tmp/softether-vpnserver.tar.gz &&\
        make i_read_and_agree_the_license_agreement &&\
        apt-get purge -y -q --auto-remove gcc make wget

ADD run.sh /usr/local/vpnserver/run.sh
RUN chmod 755 /usr/local/vpnserver/run.sh

EXPOSE  992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp

ENTRYPOINT ["/usr/local/vpnserver/run.sh"]
