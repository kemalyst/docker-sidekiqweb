FROM drujensen/crystal:0.22.0-1

ENV SIDEKIQ_VERSION master

RUN curl -L https://github.com/mperham/sidekiq.cr/archive/$SIDEKIQ_VERSION.tar.gz | tar xvz -C /usr/local/share/. && cd /usr/local/share/sidekiq.cr-$SIDEKIQ_VERSION && crystal deps && crystal build --no-debug --release -o sidekiqweb examples/web.cr

RUN ln -s /usr/local/share/sidekiq.cr-$SIDEKIQ_VERSION/sidekiqweb /usr/local/bin/sidekiqweb

WORKDIR /app/user

CMD ["sidekiqweb"]
