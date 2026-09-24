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

## Testing

```
rake test
```

Fetches and builds a PicoRuby VM into `vendor/` (git-ignored, not pinned
to any particular version) on first run, then runs `test/` against it
with [picoruby-picotest](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-picotest).
`rake clean` removes `vendor/`; `rake clean_test` runs both in sequence.

## License

MIT
