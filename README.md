# Felix Pojtinger's `mather-rb`

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

## Features

- Add numbers
- Subtract numbers

## Usage

### From Source (Interpreter)

```bash
# Build
make

# Run
make run
```

### From Source (Binary)

```bash
# Build
make

# Build binary
make build-binary-linux-amd64
# or
make build-binary-darwin-amd64

# Install binary
make install-binary-linux-amd64
# or
make install-binary-darwin-amd64

# Run
math-rb-server
```

## License

`mather-rb` (c) 2019 Felix Pojtinger

SPDX-License-Identifier: AGPL-3.0
