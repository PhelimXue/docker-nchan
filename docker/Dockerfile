FROM nginx:1.26.3-alpine AS build

ENV NGINX_VERSION=1.26.3
ENV NCHAN_VERSION=1.3.7

RUN apk add --no-cache gcc make g++ zlib-dev linux-headers pcre-dev openssl-dev && mkdir /usr/src \
&& curl -fSL http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx.tar.gz \
&& tar -C /usr/src -xzf nginx.tar.gz \
&& curl -fSL https://github.com/slact/nchan/archive/v${NCHAN_VERSION}.tar.gz -o nchan.tar.gz \
&& tar -C /usr/src -xzf nchan.tar.gz

WORKDIR /usr/src/nginx-${NGINX_VERSION}
RUN NGINX_ARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p') \
./configure --with-compat --with-http_ssl_module --with-http_dav_module --add-dynamic-module=/usr/src/nchan-${NCHAN_VERSION} ${NGINX_ARGS} \
&& make modules

FROM nginx:1.26.3-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/nginx-${NGINX_VERSION}/objs/ngx_nchan_module.so /usr/lib/nginx/modules/
