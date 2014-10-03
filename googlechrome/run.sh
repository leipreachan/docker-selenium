docker run --rm --net=host -i -p 5901:5900 -p 4502:4501 -v /home/selenium/PhotosForTests:/home/selenium/PhotosForTests -v /var/log/docker-selenium:/var/log/selenium -t selenium/googlechrome
