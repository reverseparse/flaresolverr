FROM ghcr.io/flaresolverr/flaresolverr:latest

USER root
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates \
 && curl -sL -o /usr/local/bin/wgcf https://github.com/ViRb3/wgcf/releases/download/v2.2.22/wgcf_2.2.22_linux_amd64 \
 && chmod +x /usr/local/bin/wgcf \
 && curl -sL https://github.com/pufferffish/wireproxy/releases/latest/download/wireproxy_linux_amd64.tar.gz \
    | tar -xz -C /usr/local/bin wireproxy \
 && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER flaresolverr
CMD ["/start.sh"]
