FROM alpine:latest

MAINTAINER martin@majlis.cz
LABEL maintainer=martin@majlis.cz

LABEL alpine=latest


COPY logger.sh /

ENTRYPOINT ["sh", "/logger.sh"]
