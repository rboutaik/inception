FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server


COPY tools/mariadb_script.sh /mariadb_script.sh

RUN chmod +x mariadb_script.sh

ENTRYPOINT ["./mariadb_script.sh"]
