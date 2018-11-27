# Docker Hugo

This is a docker version of [Hugo], based on Alpine Linux.

## Usage

- Pull this image from docker repos
> docker pull oliveirarthur/hugo
- Run this image and mount any directory you want to use on hugo to the `/app` folder
> docker run -v $(pwd):/app oliveirarthur/hugo hugo
- And you can even run a shell inside a container
> docker run -v $(pwd):/app -it oliveirarthur/hugo sh

## Building from scratch

- Clone this repository and `cd` into it
- Build the docker image and tag the result
> docker build . -t oliveirarthur/hugo

[Hugo]: https://gohugo.io/
