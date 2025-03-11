FROM php:8.1-apache

ARG IMAGE_BUILD_AT=""

RUN echo "IMAGE_BUILD_AT (0): ${IMAGE_BUILD_AT}"

RUN if [ -z "$IMAGE_BUILD_AT" ]; then \
      echo "@ERROR: Argument IMAGE_BUILD_AT is empty. Check command 'docker build --build-arg IMAGE_BUILD_AT=...'." >&2; \
      exit 123; \
    else \
      echo "IMAGE_BUILD_AT (1): '${IMAGE_BUILD_AT}'"; \
    fi
