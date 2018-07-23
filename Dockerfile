FROM alpine

LABEL maintainer Simon Sommer-Yakov <simon@s-m-y.com>

RUN apk --update add git openssh git-lfs && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN git lfs install --system
RUN git config --system url."git@github.com:".insteadOf https://github.com/
RUN git config --system url."git@bitbucket.org:".insteadOf https://bitbucket.org/
VOLUME /git
WORKDIR /git
COPY pre_git.sh /root
ENTRYPOINT ["/root/pre_git.sh"]
CMD ["--help"]

