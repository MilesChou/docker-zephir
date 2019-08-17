#!/usr/bin/make -f

IMAGE := mileschou/zephir
VERSION := latest

# ------------------------------------------------------------------------------

all:
	docker build -t=$(IMAGE) -f Dockerfile .

sh:
	docker run -it --rm $(IMAGE) sh
