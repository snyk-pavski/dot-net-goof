FROM wordpress:6.6.0

RUN apt-get update
RUN apt-get install -y imagemagick
