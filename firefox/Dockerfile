# webdriver + firefox 
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get install --no-install-recommends -y firefox

ENV FIREFOX_VERSION 33.0.1
ENV FIREFOX_PATH /home/$SELENIUM_USER/firefox
# we must use http://ftp.mozilla.org, not ftp:// 
RUN (cd /tmp; wget --progress=bar:force http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2 -O /home/$SELENIUM_USER/firefox-${FIREFOX_VERSION}.tar.bz2)
RUN (cd /home/$SELENIUM_USER; tar xvf /home/$SELENIUM_USER/firefox-${FIREFOX_VERSION}.tar.bz2; rm /home/$SELENIUM_USER/firefox-${FIREFOX_VERSION}.tar.bz2)

ENV SELENIUM_VERSION_MAJOR 2.44
ENV SELENIUM_VERSION_FULL ${SELENIUM_VERSION_MAJOR}.0
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN ($FIREFOX_PATH/firefox-bin --version | grep 'Firefox' | awk '{print $3}' > /home/$SELENIUM_USER/firefox-version)

RUN mkdir -p ~/bin
ADD ./bin/vnc_settings.ini /home/$SELENIUM_USER/bin/
ADD ./bin/vnc.sh /home/$SELENIUM_USER/bin/
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/
RUN chmod +x /home/$SELENIUM_USER/bin/*

CMD ["/home/selenium/bin/entrypoint.sh"]
