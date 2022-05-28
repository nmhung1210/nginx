FROM nginx:alpine

ENV CONF=""
ENV AUTH=""

RUN cat > /etc/nginx/nginx.conf <<- EOM
worker_processes auto;
pid /run/nginx.pid;
events {
  worker_connections 102400;
  multi_accept on;
}
include /etc/nginx/conf.d/*.conf;
EOM

RUN cat > /etc/nginx/templates/default.conf.template <<- EOM
${CONF}
EOM

RUN cat > /docker-entrypoint.d/00-authbasic.sh <<- EOM
#!/bin/sh
# vim:sw=4:ts=4:et
echo $AUTH > /root/.htpasswd
EOM
