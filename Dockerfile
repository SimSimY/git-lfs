FROM alpine

LABEL maintainer Simon Sommer-Yakov <simon@s-m-y.com>

RUN apk --update add git openssh git-lfs && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN git lfs install --system
RUN git config --global url."git://".insteadOf https://
VOLUME /git
WORKDIR /git

ENTRYPOINT ["git"]
CMD ["--help"]

