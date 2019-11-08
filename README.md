# Mather Server (in Ruby)

A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.

[![Build Status](https://travis-ci.com/pojntfx/mather-rb.svg?branch=master)](https://travis-ci.com/pojntfx/mather-rb)

## Features

- Add numbers
- Subtract numbers

## Usage

### From Prebuilt Binaries

Prebuilt binaries are available on the [releases page](https://github.com/pojntfx/mather-rb/releases/latest).

### From Source (Interpreter)

```bash
# Install dependencies
bundle install

# Build
rake

# Run
rake run
```

### From Source (Binary)

```bash
# Install dependencies
bundle install

# Install dependencies (for `rubyc`)
sudo rake 'rubyc_install_dependencies[linux,amd64]'
# or
sudo rake 'rubyc_install_dependencies[darwin,amd64]'

# Clean files (from `rubyc`, optional)
rake rubyc_clean

# Build
rake

# Build binary (with `rubyc`)
rake 'rubyc_build_binary[linux,amd64]'
# or
rake 'rubyc_build_binary[darwin,amd64]'

# Install binary (from `rubyc`)
sudo rake 'rubyc_install_binary[linux,amd64]'
# or
sudo rake 'rubyc_install_binary[darwin,amd64]'

# Run
mather-rb-server start
```

## License

`mather-rb` (c) 2019 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
