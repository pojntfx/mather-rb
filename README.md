# Mather Service (in Ruby)

Simple gRPC microservice that does math.

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
bundle install --path vendor/bundle

# Clean (optional)
bundle exec rake clean

# Build
bundle exec rake

# Run
bundle exec rake run
```

### From Source (Binary)

```bash
# Install dependencies
bundle install --path vendor/bundle

# Install dependencies (for `rubyc`)
sudo `which bundle` exec rake rubyc_install_dependencies
sudo `which bundle` exec rake 'rubyc_install_rubyc[linux,amd64]'
# or
bundle exec rake rubyc_install_dependencies
sudo `which bundle` exec rake 'rubyc_install_rubyc[darwin,amd64]'

# Clean (optional)
bundle exec rake clean

# Build
bundle exec rake

# Build binary (with `rubyc`)
bundle exec rake 'rubyc_build_binary[linux,amd64]'
# or
bundle exec rake 'rubyc_build_binary[darwin,amd64]'

# Install binary (from `rubyc`)
sudo `which bundle` exec rake 'rubyc_install_binary[linux,amd64]'
# or
sudo `which bundle` exec rake 'rubyc_install_binary[darwin,amd64]'

# Run
mather-rb-server start
```

## License

Mather Service (in Ruby) (c) 2019 Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0
