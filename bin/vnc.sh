#!/usr/bin/env bash
export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
export CONTAINER_IP=$(ip addr | egrep "inet.*(wlan|eth)[0-9]+" | awk '{print $2}' | cut -d '/' -f 1)
export DOCKER_HOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
export VNC_PORT=5900
export XVFB_LOG="/var/log/selenium/Xvfb_headless.log"
export FLUXBOX_LOG="/var/log/selenium/fluxbox_manager.log"
export VNC_LOG="/var/log/selenium/x11vnc_forever.log"

cat /tmp/hosts >> /etc/hosts
echo "docker.host.dev $DOCKER_HOST_IP" >> /etc/hosts
echo "docker.guest.dev $CONTAINER_IP" >> /etc/hosts

# Start the X server that can run on machines with no display
# hardware and no physical input devices
sudo -E -i -u selenium /usr/bin/Xvfb $DISPLAY -screen 0 $GEOMETRY -ac >$XVFB_LOG 2>&1 &
sleep 0.5

# A fast, lightweight and responsive window manager
sudo -E -i -u selenium fluxbox -display $DISPLAY >$FLUXBOX_LOG 2>&1 &

# Start a GUI xTerm to help debugging when VNC into the container
sudo -E -i -u selenium x-terminal-emulator -maximized -title "x-terminal-emulator" 2>&1 &
sleep 0.5

# Start VNC server to enable viewing what's going on but not mandatory
sudo -E -i -u selenium x11vnc -forever -shared -rfbport $VNC_PORT -display $DISPLAY > $VNC_LOG 2>&1 &
