FROM ubuntu:20.04

RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends libstdc++6 python-pygments git ca-certificates curl ruby gem \
	&& gem install asciidoctor asciidoctor-pdf asciidoctor-html5s asciidoctor-diagram\
	&& rm -rf /var/lib/apt/lists/*

ENV HUGO_VERSION 0.73.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'
ENV PATH="/my-bin:${PATH}"

ADD hugo-fake-bin /hugo-fake-bin
ADD my-bin /my-bin

RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir ${SITE_DIR}

WORKDIR ${SITE_DIR}

EXPOSE 1313

ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server