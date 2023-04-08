FROM rocker/tidyverse As R-code

WORKDIR /opt/laliga

ENV TZ="America/Chicago"

COPY . .

RUN apt-get update && apt-get install -yq \
  curl \
  apt-utils \
  awscli 

RUN apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
    
RUN bash /opt/laliga/scripts/build.sh

    
FROM nginx:alpine AS nginx-code

WORKDIR /opt/nginx

RUN chown -R nginx:nginx /usr/share/

RUN mkdir /usr/share/data && mkdir /usr/share/data/www

COPY --from=R-code /opt/laliga .

COPY --from=R-code /opt/laliga/laligaTable.html /usr/share/data/www

RUN mv /usr/share/data/www/laligaTable.html /usr/share/data/www/index.html

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.ORIGINAL && touch /etc/nginx/nginx.conf 

RUN sh /opt/nginx/scripts/nginx.sh

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]