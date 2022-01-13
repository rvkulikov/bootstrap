FROM klakegg/hugo:0.82.1-ext-debian as hugo

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# Set the locale
# Download NODE and GIT
RUN apt-get clean && apt-get -y update && \
    apt-get install -y apt-utils locales curl && locale-gen en_CA.UTF-8 && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y vim git && \
    apt-get clean

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 775 /usr/local/bin/docker-entrypoint.sh \
 && ln -s     /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]