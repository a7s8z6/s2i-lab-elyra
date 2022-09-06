FROM localhost/s2i-minimal-py38-notebook:latest

ENV JUPYTER_ENABLE_LAB="1" \
    CRIO_RUNTIME="1"


USER root

# Copying scripts and source files
COPY scripts /tmp/scripts
COPY src /tmp/src

RUN chown -R 1001:0 /tmp/scripts /tmp/src
USER 1001
RUN /tmp/scripts/config
CMD ["/tmp/scripts/run"]
