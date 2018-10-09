FROM ubuntu:18.04
MAINTAINER Captain RedBeard
RUN apt-get update -y && apt-get install gnupg -y
ENV DEBIAN_FRONTEND noninteractive
RUN  echo "deb http://repo.pritunl.com/stable/apt bionic main" >> /etc/apt/sources.list.d/pritunl.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
RUN  apt-get update
RUN apt-get update -yq && \
    apt-get install -yq software-properties-common python3-software-properties && \
    apt-get update -yq && \
    apt-get install -yq pritunl && \
    apt-get install -yq mongodb && \
    apt-get clean -y && \
    apt-get autoremove -y

ADD mongodb.conf /etc/mongodb.conf
ADD pritunl.conf /etc/pritunl.conf

ADD cmdline.sh /usr/local/bin/cmdline.sh

EXPOSE 1194
EXPOSE 9700

ENTRYPOINT ["/usr/local/bin/cmdline.sh"]

CMD ["/usr/bin/tail", "-f", "/var/log/pritunl.log"]
