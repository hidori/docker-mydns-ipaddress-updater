FROM alpine:3.21

RUN apk --update add curl

CMD while :; do \
        curl --user $ID:$PW http://www.mydns.jp/login.html; \
        sleep $INTERVAL; \
    done
