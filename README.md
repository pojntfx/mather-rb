# Felicitas Pojtinger's `mather-rb`

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

## Features

- Add numbers
- Subtract numbers

## Usage

```bash
# Build protos
cd ./src/svc/proto/
grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. ./mather.proto
cd ../../../

# Run
./src/cmd/server/mather
```

## License

`mather-rb` (c) 2019 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
