FROM alpine:3

RUN apk add --no-cache bash py-pygments git ca-certificates curl ruby less make libc6-compat libstdc++ \
    && gem install asciidoctor asciidoctor-pdf asciidoctor-html5s asciidoctor-diagram coderay pygments.rb \
    && gem cleanup \
    && rm -rf /tmp/* /var/cache/apk/* ~/.cache/pip


ENV HUGO_VERSION 0.78.2
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_DIR /usr/local/bin

RUN mkdir -p ${HUGO_DIR} ; curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}" | tar -xz -C ${HUGO_DIR}

COPY hugo-fake-bin /hugo-fake-bin
COPY my-bin /my-bin

ENV PATH="/my-bin:${PATH}"

EXPOSE 1313
ENV HUGO_BASE_URL http://localhost:1313
ENV SITE_DIR /usr/share/blog
WORKDIR ${SITE_DIR}

ENTRYPOINT [ "entrypoint.sh" ]
CMD server