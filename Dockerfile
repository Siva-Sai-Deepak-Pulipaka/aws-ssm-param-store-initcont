FROM        amazon/aws-cli
RUN         yum install jq -y
COPY        run.sh /
ENTRYPOINT  [ "bash", "/run.sh" ]
