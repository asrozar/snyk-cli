FROM ubuntu:22.04
LABEL maintainer="avery.rozar@trolleyesecurity.com"
WORKDIR /app/
ENV TZ=Us/Eastern
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt dist-upgrade -y && apt install curl -y && \
  curl --compressed https://static.snyk.io/cli/latest/snyk-linux -o snyk && \
  chmod +x ./snyk && \
  mv ./snyk /usr/local/bin/ && \
  id -u ccscanner &>/dev/null || useradd ccscanner --system --shell=/usr/sbin/nologin --home-dir=/app && \
  mkdir /app && \
  chown ccscanner:ccscanner -R /app/
USER ccscanner