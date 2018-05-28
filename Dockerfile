FROM node:9-alpine

ARG DAEMON_VER=0.5.6

LABEL maintainer="Spritsail <pterodactyl-daemon@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Pterodactyl Daemon" \
      org.label-schema.url="https://pterodactyl.io" \
      org.label-schema.description="Image for the daemon component of the Pterodactyl Panel" \
      org.label-schema.version=$DAEMON_VER \
      io.spritsail.version.pterodactyl.daemon=${DAEMON_VER}

WORKDIR /srv/daemon

RUN apk add --no-cache -t .build-deps curl make gcc g++ python gnupg \
 && apk add --no-cache openssl tar \
 && curl -fsSL "https://github.com/pterodactyl/daemon/releases/download/v${DAEMON_VER}/daemon.tar.gz" \
     | tar xz --strip-components=1 \
 && npm install --production \
 && apk del .build-deps \
    # Clean up the npm build cache
 && find /root -maxdepth 1 -name '.*' -print0 | xargs -0 rm -rf

EXPOSE 8080

VOLUME ["/srv/daemon/config", "/srv/daemon/packs", "/srv/daemon/scripts", "/tmp/pterodactyl"]

CMD ["npm", "start"]
