FROM wordpress:6.4.0

RUN apt-get update
RUN apt-get install -y imagemagick
