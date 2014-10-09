FROM ubuntu:14.04.1
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#==========
# update
#==========
RUN apt-get update && apt-get install --no-install-recommends -y \
	curl \
	ca-certificates \
	wget \
	unzip \
	x11vnc \
	xvfb \
	xterm \
	xfonts-100dpi \
	xfonts-75dpi \
	xfonts-scalable \
	xfonts-cyrillic \
	screen \
	fluxbox \
	openjdk-7-jre-headless \
	libasound2 #ff and chrome depend on these \
	libc6 \
	libcairo2 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgcc1 \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk2.0-0 \
	libstdc++6 \
	libx11-6 \
	libxext6 \
	libxrender1

ENV SELENIUM_USER selenium
#========================================
# Add normal user with passwordless sudo
#========================================
RUN sudo useradd ${SELENIUM_USER} --shell /bin/bash --create-home
RUN sudo usermod -a -G sudo ${SELENIUM_USER} && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

#=================
# Locale settings
#=================
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

#==================
# Reconfigure
#=================
RUN dpkg-reconfigure --frontend noninteractive locales
RUN apt-get -qqy install language-pack-en

#===================
# Timezone settings
#===================
ENV TZ "Europe/Moscow"
RUN echo "Europe/Moscow" | sudo tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

#===========
# DNS stuff
#===========
ADD ./etc/hosts /tmp/hosts

#========================
# configure hosts
#========================
ADD ./etc/hosts /tmp/hosts
ADD ./etc/interfaces /etc/network/interfaces

#================================
# Expose Container's Directories
#================================
VOLUME /var/log/selenium

ENV SCREEN_WIDTH 1280
ENV SCREEN_HEIGHT 960
ENV SCREEN_DEPTH 24
ENV DISPLAY :10.0

#========================
# Configure VNC without password
#========================
RUN mkdir -p /home/$SELENIUM_USER/.vnc
RUN x11vnc -storepasswd badoo /home/$SELENIUM_USER/.vnc/passwd
