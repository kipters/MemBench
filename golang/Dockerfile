FROM golang:1.20 AS build
COPY golang /src/
WORKDIR /src
RUN go build -ldflags "-s -w"

FROM scratch AS golang
COPY --from=build /src/MemBench .