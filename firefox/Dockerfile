# webdriver + firefox 
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get install -y firefox

ENV FIREFOX_VERSION 32.0.3
ENV FIREFOX_PATH /home/$SELENIUM_USER/firefox
RUN (cd /tmp; wget --progress=bar:force ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2 -O /home/$SELENIUM_USER/firefox-${FIREFOX_VERSION}.tar.bz2)
RUN (cd /home/$SELENIUM_USER; tar xvf /home/$SELENIUM_USER/firefox-${FIREFOX_VERSION}.tar.bz2)

ENV SELENIUM_VERSION_MAJOR 2.43
ENV SELENIUM_VERSION_FULL 2.43.1
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

ENV SELENIUM_PORT 4501
EXPOSE 4501 5900

RUN mkdir -p ~/bin
ADD ./bin/vnc.sh /home/$SELENIUM_USER/bin/vnc.sh
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/entrypoint.sh
RUN chmod +x /home/$SELENIUM_USER/bin/*
RUN echo "starting selenium ${SELENIUM_VERSION_MAJOR} as user ${SELENIUM_USER} and firefox version ${FIREFOX_VERSION} on display ${DISPLAY}"

CMD ["/home/selenium/bin/entrypoint.sh"]
