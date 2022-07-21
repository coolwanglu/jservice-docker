FROM ruby:2.2

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
COPY build /
WORKDIR /src
RUN \
  git clone https://github.com/sottenad/jService.git && \
  cd jService && \
  bundle install && \ 
  patch -p1 < /build/jservice.patch && \
  cd / && \
  patch -p1 < /build/bundle.patch

WORKDIR /src/jService

CMD rm -rf tmp/pids/server.pid && rails s
