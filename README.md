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

