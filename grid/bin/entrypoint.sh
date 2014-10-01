#!/usr/bin/env bash

sudo -E -i -u ${SELENIUM_USER} \
    java -jar ${SELENIUM_PATH} -port ${SELENIUM_PORT} -registerCycle 30000  -role hub -hubConfig /home/$SELENIUM_USER/grid.json -servlets org.openqa.grid.web.servlet.HubStatusServlet > /var/log/selenium/selenium-hub-${SELENIUM_PORT}.log 2>&1
