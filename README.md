# hugo-docker

Wrapping [hugo](https://github.com/gohugoio/hugo) golang binary executable into a Docker image.

## Usage

To get help:
```bash
docker run -it --rm zhaowde/hugo-docker:latest --help
```

To build the site:
```bash
docker run -it --rm -v $PWD:/src zhaowde/hugo-docker:latest 
```

To run hugo in watching mode:
```bash
docker run -it --rm -v $PWD:/src -p 1313:1313 zhaowde/hugo-docker:latest server --bind 0.0.0.0 -D
```

## To update

1. Go to https://github.com/gohugoio/hugo/tags, find the newest version. e.g. `v0.110.0`
2. Edit `Dockerfile`, update the following line to match the newest version above (without the prefix `v`):
   ```
   ENV HUGO_VERSION=0.110.0
   ```
3. Build and public the image:
   ```bash
   docker buildx build --push --allow security.insecure --push --platform linux/amd64,linux/arm64 --builder rcplus \
      --tag zhaowde/hugo-docker:0.110.0 --tag zhaowde/hugo-docker:latest --progress plain .
   ```
4. In case (3) complains "ERROR: no builder "rcplus" found":
   ```bash
   docker buildx create --bootstrap --name rcplus --driver docker-container --platform linux/amd64,linux/arm64 --use --buildkitd-flags '--allow-insecure-entitlement security.insecure'
   ```
