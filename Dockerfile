FROM nginx:alpine

ENV CONF=""
ENV AUTH=""

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY 00-authbasic.sh /docker-entrypoint.d/00-authbasic.sh
