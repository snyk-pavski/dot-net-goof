FROM wordpress:6.0.0

RUN apt-get update
RUN apt-get install -y imagemagick
