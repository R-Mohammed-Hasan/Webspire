FROM ruby:2.6.10

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /webspire
WORKDIR /webspire
COPY . /webspire/

RUN bundle install

# RUN echo "=============================="

# This doesn't work since the DB is not available till this point of application, only after spinning 
# RUN chmod +x ./entrypoint.sh
# ENTRYPOINT ["./entrypoint.sh"]
