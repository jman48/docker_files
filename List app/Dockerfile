FROM phusion/passenger-ruby22:0.9.18
MAINTAINER John Armstrong <j.armstrong484@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Clean up APT when done and configure nginx
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm /etc/nginx/sites-enabled/default
ADD docker-files/webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD docker-files/webapp-env.conf /etc/nginx/main.d/webapp-env.conf

#Create app direcory and install
RUN mkdir /home/app/webapp
ADD . /home/app/webapp
RUN cd /home/app/webapp && bundle install

#Start nginx
RUN rm -f /etc/service/nginx/down

LABEL name="listapp-image" version="0.1"
