FROM postgres:15

COPY 01-init.sql /docker-entrypoint-initdb.d/
COPY 02-seed.sql /docker-entrypoint-initdb.d/
