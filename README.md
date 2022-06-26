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

1. Go to https://github.com/gohugoio/hugo/tags, find the newest version. e.g. `v0.101.0`
2. Edit `Dockerfile`, update the following line to match the newest version above (without the prefix `v`):
   ```
   ENV HUGO_VERSION=0.101.0
   ```
3. Build and public the image:
   ```bash
   docker build . -t zhaowde/hugo-docker:0.101.0 -t zhaowde/hugo-docker:latest
   docker push zhaowde/hugo-docker:0.101.0
   docker push zhaowde/hugo-docker:latest
   ```
