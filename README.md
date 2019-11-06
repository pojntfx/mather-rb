# Felicitas Pojtinger's `mather-rb`

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

## Features

- Add numbers
- Subtract numbers

## Usage

### From Source (Interpreter)

```bash
# Build
rake

# Run
rake run
```

### From Source (Binary)

```bash
# Build
rake

# Build binary
rake 'build_binary[linux,amd64]'
# or
rake 'build_binary[darwin,amd64]'

# Install binary
sudo rake 'install_binary[linux,amd64]'
# or
sudo rake 'install_binary[darwin,amd64]'

# Run
math-rb-server
```

## License

`mather-rb` (c) 2019 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
