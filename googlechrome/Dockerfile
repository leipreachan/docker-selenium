# webdriver + firefox 
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV SELENIUM_PORT 4501

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable

RUN (google-chrome --version | awk '{print $2}' > /home/$SELENIUM_USER/google-chrome-version)

ENV SELENIUM_VERSION_MAJOR 2.43
ENV SELENIUM_VERSION_FULL 2.43.1
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

EXPOSE 4501 5900

RUN mkdir -p ~/bin
ADD ./bin/vnc.sh /home/$SELENIUM_USER/bin/vnc.sh
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/entrypoint.sh
RUN chmod +x /home/$SELENIUM_USER/bin/*
RUN echo "starting selenium ${SELENIUM_VERSION_MAJOR} as user ${SELENIUM_USER} and firefox version ${FIREFOX_VERSION} on display ${DISPLAY}"

CMD ["/home/selenium/bin/entrypoint.sh"]
