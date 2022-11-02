FROM golang:1.18-bullseye as build

WORKDIR /go/src/app
ADD . /go/src/app
RUN go mod download
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /go/bin/app /go/src/app/server.go

FROM golang:1.18-alpine

COPY --from=build /go/bin/app /

EXPOSE 8080
CMD ["/app"]
