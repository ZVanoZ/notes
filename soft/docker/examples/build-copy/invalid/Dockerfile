FROM php:8.1-apache

#COPY --chmod=755 --chown=root            \
#    ./docker-run/root/*                  \
#    /docker-run/root/
#
#COPY --chmod=755 --chown=root            \
#    ./docker-run/www-data/*              \
#    /docker-run/www-data/

COPY --chmod=755 --chown=root            \
    ./docker-run/*                       \
    /docker-run/

#COPY --chmod=755 --chown=root            \
#    ./docker-run                       \
#    /

ENTRYPOINT ["/usr/bin/bash"]
CMD ["/docker-run/entrypoint.sh"]