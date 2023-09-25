FROM golang:1.21-alpine as builder

WORKDIR /go/src/app

COPY myapp/ myapp/

WORKDIR /go/src/app/myapp

RUN apk add --no-cache git
RUN go mod download

RUN CGO_ENABLED=0 go build -o /go/bin/myapp "cmd/myapp/main.go"

FROM gcr.io/distroless/static-debian11

COPY --from=builder /go/bin/myapp /

CMD ["./myapp", "serve", "--http=0.0.0.0:8090"]
