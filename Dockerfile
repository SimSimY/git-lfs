FROM alpine

LABEL maintainer Simon Sommer-Yakov <simonya@gmail.com>

RUN apk --update add git openssh git-lfs && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN git lfs install --system
RUN git config --global url."https://".insteadOf git://
VOLUME /git
WORKDIR /git

ENTRYPOINT ["git"]
CMD ["--help"]

