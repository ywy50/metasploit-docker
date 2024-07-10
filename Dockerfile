# -----------------------------------------------------------------------------
# Base step
# -----------------------------------------------------------------------------
FROM metasploitframework/metasploit-framework AS base

RUN mkdir -p /opt/app

ENV RUNTIME_DIR="/opt/app"

WORKDIR $RUNTIME_DIR

RUN apt update

COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod +x /opt/docker-entrypoint.sh

# -----------------------------------------------------------------------------
# Production step
# -----------------------------------------------------------------------------
FROM base AS production

COPY ./scripts $RUNTIME_DIR/scripts

# Use JSON array syntax for ENTRYPOINT
ENTRYPOINT ["/opt/docker-entrypoint.sh"]

CMD ["$0", "$@"]
