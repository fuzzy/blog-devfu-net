FROM reg.devfu.net/smore
RUN mkdir /app
COPY site.yml /config/
CMD /bin/sh -c '/go/bin/smore -config /config/site.yml'
