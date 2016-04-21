FROM alejandrofcarrera/phusion.python
MAINTAINER Alejandro F. Carrera

ENV HOME /usr/lib/glcollector

# Create directories & virtual env
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/glcollector

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

EXPOSE 5000

VOLUME ["/usr/lib/glcollector"]
