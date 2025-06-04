FROM apache/spark:3.5.0

COPY entrypoint.sh /opt/scripts/entrypoint.sh

USER root
RUN chown -R spark:spark /opt/spark/events
USER spark
ENTRYPOINT [ "/opt/script/entrypoint.sh" ]