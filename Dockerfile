FROM golang:alpine AS builder
RUN apk update && apk add --no-cache ca-certificates tzdata && update-ca-certificates

FROM scratch
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ADD frontend/dist /frontend/dist
ADD frontend/src /frontend/src
ADD flamingo-commerce-demo-carotene /flamingo-commerce-demo-carotene
ADD config /config
ADD translations /translations
ADD resources /resources
ADD docs/swagger.json /docs/swagger.json

ENTRYPOINT ["/flamingo-commerce-demo-carotene"]
CMD ["serve"]
