FROM ubuntu:20.04

RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends libstdc++6 python-pygments git ca-certificates curl ruby gem less \
	&& gem install asciidoctor asciidoctor-pdf asciidoctor-html5s asciidoctor-diagram \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sL -o /tmp/docker.deb "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_19.03.10~3-0~ubuntu-focal_amd64.deb" \
	&& dpkg -i /tmp/docker.deb \
	&& rm -rf /tmp/docker.deb


ENV PATH="/my-bin:${PATH}"

COPY hugo-fake-bin /hugo-fake-bin
COPY my-bin /my-bin

ENV HUGO_VERSION 0.78.2
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'

RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir ${SITE_DIR}

WORKDIR ${SITE_DIR}

EXPOSE 1313

ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server