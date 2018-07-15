FROM alpine

LABEL maintainer Simon Sommer-Yakov <simonya@gmail.com>

RUN apk --update add git openssh git-lfs && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN git lfs install --system
RUN git config --system url."git@github.com:".insteadOf https://github.com/
RUN git config --system url."git@bitbucket.org:".insteadOf https://bitbucket.org/
VOLUME /git
WORKDIR /git

ENTRYPOINT ["git"]
CMD ["--help"]

