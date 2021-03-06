FROM alpine

RUN apk -U --no-cache upgrade \
 && apk -U --no-cache add ca-certificates

COPY sqs-to-kafka /bin/sqs-to-kafka
RUN chmod 755 /bin/sqs-to-kafka \
 && adduser -s /bin/nologin -H -D sqs-to-kafka sqs-to-kafka

ENV METRICS_ADDRESS=:8080
EXPOSE 8080

USER sqs-to-kafka
CMD sqs-to-kafka
