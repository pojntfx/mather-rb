# Felix Pojtinger's `mather-rb`

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

## Features

- Add numbers
- Subtract numbers

## Usage

```bash
# Build protos
cd ./src/lib/proto/
grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. ./mather.proto
cd ../../../

# Run
./src/cmd/mather
```

## License

`mather-rb` (c) 2019 Felix Pojtinger

SPDX-License-Identifier: AGPL-3.0
