FROM golang:1.13-alpine as build

ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

WORKDIR /go/src/gpushare-scheduler-extender
COPY go.mod .
COPY go.sum .
RUN GO111MODULE=on go mod download
COPY . .

RUN go build -o /go/bin/gpushare-sche-extender cmd/*.go

FROM alpine

COPY --from=build /go/bin/gpushare-sche-extender /usr/bin/gpushare-sche-extender

CMD ["gpushare-sche-extender"]
