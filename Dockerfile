FROM ruby:2.4.2

RUN set -xe \
 && mkdir -p /features \
 && gem install cucumber capybara \
 && gem install selenium-webdriver -v 2.53.4 \
 && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
 && apt-get update \
 && apt-get install -y google-chrome-stable chromedriver \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
WORKDIR /features

ENTRYPOINT ["cucumber"]
