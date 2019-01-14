FROM debian

# Install required packages with apt
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update && apt-get install -y \
  postfix \
  rsyslog \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Expose network
EXPOSE 25

# Expose filesystem
VOLUME /postfix /var/spool/postfix

# Install entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["bash","/docker-entrypoint.sh"]

# Start myHouse
CMD ["postfix"]
