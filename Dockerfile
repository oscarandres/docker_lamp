FROM ubuntu:trusty
MAINTAINER Oscar Andrés Monroy "oscar.andres.monroy@gmail.com"

RUN apt-get update
RUN apt-get install -y openssh-server apache2 php5 mysql-server php5-mysql php5-gd

RUN mkdir /var/run/sshd 
RUN echo 'root:prueba1234' |chpasswd

EXPOSE 22 80
CMD    /usr/sbin/sshd -D
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
