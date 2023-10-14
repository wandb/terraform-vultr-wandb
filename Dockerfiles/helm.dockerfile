FROM alpine:latest

RUN apk update && apk install kubectl helm krew