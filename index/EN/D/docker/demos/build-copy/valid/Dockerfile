FROM php:8.1-apache

COPY --chmod=755 --chown=root            \
    ./docker-run/.                       \
    /docker-run/

ENTRYPOINT ["/usr/bin/bash"]
CMD ["/docker-run/entrypoint.sh"]