# Felicitas Pojtinger's `mather-rb`

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

## Features

- Add numbers
- Subtract numbers

## Usage

### From Source (Interpreter)

```bash
# Install dependencies
bundle install

# Build
bundle exec rake

# Run
bundle exec rake run
```

### From Source (Binary)

```bash
# Install dependencies
bundle install

# Build
bundle exec rake

# Build binary
bundle exec rake 'build_binary[linux,amd64]'
# or
bundle exec rake 'build_binary[darwin,amd64]'

# Install binary
sudo bundle exec rake 'install_binary[linux,amd64]'
# or
sudo bundle exec rake 'install_binary[darwin,amd64]'

# Run
math-rb-server
```

## License

`mather-rb` (c) 2019 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
