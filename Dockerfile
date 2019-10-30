FROM alpine:latest

RUN addgroup -g 1000 flexget && \
    adduser -u 1000 -G flexget flexget -D
WORKDIR  /home/flexget

RUN apk -U upgrade && \
    apk -U add python3 ca-certificates python3-dev && \  
    update-ca-certificates
RUN pip3 install --upgrade pip &&\ 
    pip3 install flexget deluge-client

VOLUME ["/home/flexget/.flexget"]
VOLUME ["/home/flexget/downloads"]

EXPOSE 5050

COPY entrypoint.sh /home/flexget/
RUN  chmod +x ./entrypoint.sh
RUN chown -R flexget:flexget ./entrypoint.sh

USER flexget    

CMD ["./entrypoint.sh"]