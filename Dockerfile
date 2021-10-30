FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY main.go .
RUN go run main.go

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app/ /app/
CMD ["./main"]