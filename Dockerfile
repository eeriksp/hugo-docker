# Inspired by https://hub.docker.com/r/monachus/hugo/dockerfile
FROM ubuntu:latest

# Install pygments (for syntax highlighting) 
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends libstdc++6 python-pygments git ca-certificates asciidoc curl \
	&& rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION 0.78.1
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb
 
# Install node and npm
RUN snap install node --classic

    
