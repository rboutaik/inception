FROM debian:bullseye

RUN apt update && apt upgrade  && apt install adminer -y

WORKDIR /usr/share/adminer

RUN mv adminer.php index.php

ENTRYPOINT ["php" ,"-S",  "0.0.0.0:8080"]