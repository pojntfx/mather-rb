# Mather Service (in Ruby)

Simple Ruby gRPC microservice that does math.

[![Build Status](https://travis-ci.com/pojntfx/mather-rb.svg?branch=master)](https://travis-ci.com/pojntfx/mather-rb)

## Features

- Add numbers
- Subtract numbers

## Usage

### From Prebuilt Binaries

Prebuilt binaries are available on the [releases page](https://github.com/pojntfx/mather-rb/releases/latest).

### From RubyGems

```bash
# Install
gem install mather-rb

# Run
mather-rb-server start
```

### From Source

#### Prerequisites

```bash
# Install dependencies
bundle install --path .vendor/bundle

# Clean (optional)
bundle exec rake clean

# Build
bundle exec rake
```

#### Start With Toolchain

```bash
# Run
bundle exec rake start
```

#### Start As Standalone Binary

```bash
# Install dependencies (for `rubyc`)
sudo -E env "PATH=$PATH" bundle exec rake rubyc_install_dependencies
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_rubyc_install[linux,amd64]'
# or
bundle exec rake rubyc_install_dependencies
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_rubyc_install[darwin,amd64]'

# Build binary (with `rubyc`)
bundle exec rake 'rubyc_binary_build[linux,amd64]'
# or
bundle exec rake 'rubyc_binary_build[darwin,amd64]'

# Install binary (from `rubyc`)
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_binary_install[linux,amd64]'
# or
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_binary_install[darwin,amd64]'

# Run
mather-rb-server start
```

#### Unit Tests

```bash
# Start unit tests
bundle exec rake unit_tests
```

#### Integration Tests

```bash
# Start integration tests
bundle exec rake integration_tests
```

#### Integration Tests (For Standalone Binary)

```bash
# Start integration tests (for standalone binary)
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_binary_integration_tests[linux,amd64]'
# or
sudo -E env "PATH=$PATH" bundle exec rake 'rubyc_binary_integration_tests[darwin,amd64]'
```

#### Development

```bash
# Start unit tests, start server and restart both if source changed
bundle exec rake dev
```

## License

Mather Service (in Ruby) (c) 2019 Felix Pojtinger

SPDX-License-Identifier: AGPL-3.0
