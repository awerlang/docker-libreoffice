FROM ubuntu:14.04
MAINTAINER florent.aide@gmail.com

RUN apt-get update && apt-get -y -q install libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-7-jre && apt-get -q -y remove libreoffice-gnome

EXPOSE 8997

RUN adduser --home=/opt/libreoffice --disabled-password --gecos "" --shell=/bin/bash libreoffice

# replace default setup with a one disabling logos by default
ADD sofficerc /etc/libreoffice/sofficerc
ADD startoo.sh /opt/libreoffice/startoo.sh
VOLUME ["/tmp"]
RUN chmod +x /opt/libreoffice/startoo.sh
CMD ["/opt/libreoffice/startoo.sh"]
