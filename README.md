# hugo-asciidoctor
A docker image to build a hugo site with asciidoc(tor)

This image contains some fixes to produce better html.

**Latest Image**: `docker pull nidomiro/hugo-asciidoctor:latest`

**Stable Image**: `docker pull nidomiro/hugo-asciidoctor:v0.73.0-1`

More versions: https://hub.docker.com/repository/docker/nidomiro/hugo-asciidoctor


## Examples

To (forcefully) disable safe rendering register the env-var `FORCE_DISABLE_SAVE_MODE`

### Run a dev-server
```bash
docker run -it --rm -v "$PROJECT_PATH/:/usr/share/blog" -p "1313:1313" nidomiro/hugo-asciidoctor:v0.73.0-1
```

### Run a dev-server with options
```bash
docker run -it --rm -v "$PROJECT_PATH/:/usr/share/blog" -p "1313:1313" nidomiro/hugo-asciidoctor:v0.73.0-1 hugo server --buildDrafts --buildFuture --disableFastRender
```

### Build
```bash
docker run -it --rm -v "$PROJECT_PATH/:/usr/share/blog" nidomiro/hugo-asciidoctor:v0.73.0-1 hugo
```



