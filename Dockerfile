FROM mool/baseimage

MAINTAINER Pablo Gutiérrez del Castillo <pablogutierrezdelc@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y iperf \
    traceroute \
    openjdk-7-jre

RUN mkdir -p /var/cache/local/preseeding
ADD aircontrol.seed /var/cache/local/preseeding/
RUN debconf-set-selections /var/cache/local/preseeding/aircontrol.seed

RUN wget http://www.ubnt.com/downloads/aircontrol2/aircontrol2-2.0-Beta18.1416.151204.1451-ubuntu.deb && \
    dpkg -i aircontrol2-2.0-Beta18.1416.151204.1451-ubuntu.deb && \
    rm aircontrol2-2.0-Beta18.1416.151204.1451-ubuntu.deb

RUN mkdir /etc/service/aircontrol
ADD aircontrol.sh /etc/service/aircontrol/run

RUN apt-get -y clean autoclean autoremove

EXPOSE 9081

VOLUME ["/opt/Ubiquiti/AirControl2/lib/db"]

CMD ["/sbin/my_init"]
