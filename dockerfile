FROM golang:alpine as stage1

# Copy required go files
WORKDIR /app
COPY go.mod .
RUN go mod download

# Build go binary
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
WORKDIR /app
COPY --from=stage1 /app/main .
COPY ./website ./website 
CMD ["./main"]
