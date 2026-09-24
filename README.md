# picoruby-securerandom

A subset of CRuby's `securerandom` standard library, for
[PicoRuby](https://github.com/picoruby/picoruby): `random_bytes` and
`hex`.

Like CRuby's `SecureRandom` pulling from the OS's `Random.urandom`,
this pulls from PicoRuby's own randomness: `picoruby-rng`'s
`RNG.random_string` (the OS on POSIX, the hardware RNG on a
microcontroller).

Note: `picoruby-rng` also redefines `Kernel#rand` (`RNG.random_int %
max`) - any VM that includes it gets that `rand`.

## Installation

```ruby
conf.gem github: 'bash0C7/picoruby-securerandom', branch: 'main'
```

## Dependencies

- `picoruby-rng`

## Usage

```ruby
require 'securerandom'

SecureRandom.random_bytes        # => 16 random bytes (String), like CRuby's default
SecureRandom.random_bytes(32)    # => 32 random bytes

SecureRandom.hex                 # => 32-character lowercase hex string (16 bytes)
SecureRandom.hex(64)             # => 128-character lowercase hex string (64 bytes)
```

| Method | Behavior |
|---|---|
| `SecureRandom.random_bytes(n = 16)` | `n` random bytes from `RNG.random_string` |
| `SecureRandom.hex(n = 16)` | `n` random bytes, encoded as `2*n` lowercase hex characters |

`hex` builds its output one byte at a time (`String#getbyte` +
`SecureRandom::HEX_DIGITS` lookup) rather than `unpack1("H*")`, since
that needs `mruby-pack`, which this gem doesn't require.

## Where this is tested

This gem doesn't (yet) carry its own test suite. Its behavior is exercised
via [bash0C7/bash0c7-homepage](https://github.com/bash0C7/bash0c7-homepage)'s
`test/picoruby/securerandom_test.rb`, where it supplies the `SecureRandom`
that [Sinatra](https://github.com/udzura/picoruby-sinatra-covers) calls
while loading (`set :session_secret, SecureRandom.hex(64)`).

## License

MIT
