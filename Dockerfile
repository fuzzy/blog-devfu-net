FROM alpine
RUN apk update
RUN apk add go gcc libpthread-stubs util-linux musl-utils musl-dev musl git
RUN mkdir -p /config
RUN rm -rf /go/src/git.devfu.net/fuzzy/
RUN mkdir -p /go/src/git.devfu.net/fuzzy/
RUN git clone https://git.devfu.net/fuzzy/smore /go/src/git.devfu.net/fuzzy/smore
RUN env GOPATH=/go go get -v git.devfu.net/fuzzy/smore
COPY site.yml /config/
CMD /bin/sh -c '/go/bin/smore -config /config/site.yml'
