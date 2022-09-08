FROM ruby:3.1.2

RUN apt-get update
RUN apt-get install -y curl netcat

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt install nodejs
RUN npm i -g saucectl

RUN mkdir -p /sauce

WORKDIR /sauce

RUN curl https://saucelabs.com/downloads/sc-4.8.1-linux.tar.gz --output sc-4.8.1-linux.tar.gz
RUN tar -xvf sc-4.8.1-linux.tar.gz

RUN gem install webrick

COPY webserver.sh webserver.sh
COPY run_tunnel.sh run_tunnel.sh

COPY .sauce .sauce
COPY .sauceignore .sauceignore
COPY cypress cypress
COPY cypress.config.js cypress.config.js

# COPY . .

EXPOSE 8080
EXPOSE 80
EXPOSE 443

# ENTRYPOINT (bash webserver.sh &) && (bash run_tunnel.sh &) && (echo "sleeping 5" && sleep 5 && echo "finished sleeping" && saucectl run)

# ENTRYPOINT (bash webserver.sh &) && (bash run_tunnel.sh)
ENTRYPOINT bash run_tunnel.sh

#&& saucectl run --region eu-central-1

