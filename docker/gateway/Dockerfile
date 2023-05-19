ARG NGINX_VER
ARG nginx_image=nginx:$NGINX_VER
FROM $nginx_image

COPY ./snippets /etc/nginx/snippets
COPY ./conf.d /etc/nginx/conf.d
