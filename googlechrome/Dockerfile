# webdriver + chrome 
FROM selenium/ubuntu
MAINTAINER Artem Soldatkin <a.soldatkin@corp.badoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

ENV CHROMEDRIVER_VERSION 2.10

RUN wget --progress=bar:force -O /home/$SELENIUM_USER/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
RUN (cd /home/$SELENIUM_USER; unzip chromedriver_linux64.zip)
RUN rm /home/$SELENIUM_USER/chromedriver_linux64.zip
RUN chmod 755 /home/$SELENIUM_USER/chromedriver

RUN apt-get update && apt-get install -y google-chrome-stable

RUN (google-chrome --version | awk '{print $3}' > /home/$SELENIUM_USER/google-chrome-version)
 
ENV SELENIUM_VERSION_MAJOR 2.43
ENV SELENIUM_VERSION_FULL ${SELENIUM_VERSION_MAJOR}.1
ENV SELENIUM_PATH /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

RUN mkdir -p /home/$SELENIUM_USER/selenium
RUN (cd /tmp; wget --progress=bar:force http://selenium-release.storage.googleapis.com/${SELENIUM_VERSION_MAJOR}/selenium-server-standalone-${SELENIUM_VERSION_FULL}.jar -O $SELENIUM_PATH)
RUN chown $SELENIUM_USER:$SELENIUM_USER /home/$SELENIUM_USER/selenium/selenium-server-standalone.jar

#========!!!!!!======
# custom chrome-sandbox!!!
#========!!!!!!======
ENV CHROME_SANDBOX /opt/google/chrome/chrome-sandbox
ADD ./bin/chrome-sandbox ${CHROME_SANDBOX}
RUN chown root:root ${CHROME_SANDBOX}
RUN chmod 4755 ${CHROME_SANDBOX}

RUN mkdir -p ~/bin
ADD ./bin/vnc_settings.ini /home/$SELENIUM_USER/bin/
ADD ./bin/vnc.sh /home/$SELENIUM_USER/bin/
ADD ./bin/entrypoint.sh /home/$SELENIUM_USER/bin/
RUN chmod +x /home/$SELENIUM_USER/bin/*

CMD ["/home/selenium/bin/entrypoint.sh"]
