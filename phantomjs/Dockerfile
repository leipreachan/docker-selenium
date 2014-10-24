# webdriver + phantomjs
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV PHANTOMJS_VERSION 1.9.7
RUN (echo "$PHANTOMJS_VERSION" > /home/$SELENIUM_USER/phantomjs-version)
RUN (cd /tmp; wget --progress=bar:force https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -O /home/$SELENIUM_USER/phantomjs.tar.bz2)
RUN (cd /home/$SELENIUM_USER; tar xvf /home/$SELENIUM_USER/phantomjs.tar.bz2; rm /home/$SELENIUM_USER/phantomjs.tar.bz2)

ENV SELENIUM_VERSION_MAJOR 2.44
ENV SELENIUM_VERSION_FULL ${SELENIUM_VERSION_MAJOR}.0
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p ~/bin
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/
RUN chmod +x /home/$SELENIUM_USER/bin/*

CMD ["/home/selenium/bin/entrypoint.sh"]
