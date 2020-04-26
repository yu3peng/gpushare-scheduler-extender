FROM golang:1.13-alpine as build

WORKDIR /go/src/gpushare-scheduler-extender
COPY go.mod .
COPY go.sum .
RUN GO111MODULE=on go mod download
COPY . .

RUN go build -ldflags "-X 'main.BUILD_TIME=`date`' -X 'main.GO_VERSION=`go version`'" -o /go/bin/gpushare-sche-extender cmd/*.go

FROM alpine:3.11.6

COPY --from=build /go/bin/gpushare-sche-extender /usr/bin/gpushare-sche-extender

CMD ["gpushare-sche-extender"]
