#!/bin/bash
docker run --rm -v "$PWD/app":/usr/src/app -w /usr/src/app ruby:2.5.0 bundle install
