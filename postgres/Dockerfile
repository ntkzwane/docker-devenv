FROM postgres:16

RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias en_ZA.UTF-8

VOLUME /var/lib/postgresql/data/pgdata

ENV LANG en_ZA.UTF-8
ENV PGDATA=/var/lib/postgresql/data/pgdata

