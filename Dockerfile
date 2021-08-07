FROM nginx:alpine

# Remove default NGINX Config
RUN rm /etc/nginx/conf.d/default.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    adduser -S www-data -u 1000

# NGINX Config
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Resources
COPY content/ /var/www/html/

CMD ["nginx", "-g", "daemon off;"]