FROM golangci/golangci-lint:v1.23-alpine

RUN wget -O - -q https://raw.githubusercontent.com/ducla5/reviewdog/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v0.9.18

RUN apk --no-cache add git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
