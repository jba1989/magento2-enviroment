FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -y
RUN apt-get -y install php7.4 && \
 apt-get install -y php7.4-fpm php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip php7.4-common

RUN service apache2 stop && service php7.4-fpm start

RUN sed -i 's/memory_limit\ =\ 128M/memory_limit\ =\ 2G/g' /etc/php/7.4/fpm/php.ini \
 && sed -i 's/;realpath_cache_size\ =\ 4096k/realpath_cache_size\ =\ 10M/g' /etc/php/7.4/fpm/php.ini \
 && sed -i 's/;realpath_cache_ttl\ =\ 120/realpath_cache_ttl\ =\ 7200/g' /etc/php/7.4/fpm/php.ini
