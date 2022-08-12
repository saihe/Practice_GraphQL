FROM golang:1.18-bullseye as build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/app

FROM golang:1.18-alpine

COPY --from=build /go/bin/app /

CMD ["go", "run", "server.go"]
