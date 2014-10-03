# webdriver grid2 
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV SELENIUM_VERSION_MAJOR 2.43
ENV SELENIUM_VERSION_FULL ${SELENIUM_VERSION_MAJOR}.1
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p ~/bin
ADD ./bin/grid.json /home/$SELENIUM_USER/grid.json
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/entrypoint.sh
RUN chmod +x /home/$SELENIUM_USER/bin/*

CMD ["/home/selenium/bin/entrypoint.sh"]
