# picoruby-securerandom

A subset of CRuby's `securerandom` standard library, for
[PicoRuby](https://github.com/picoruby/picoruby).

Like CRuby's `SecureRandom` pulling from the OS's `Random.urandom`,
this pulls from PicoRuby's own randomness: `picoruby-rng`'s
`RNG.random_string` (the OS on POSIX, the hardware RNG on a
microcontroller).

Note: `picoruby-rng` also redefines `Kernel#rand` (`RNG.random_int %
max`) - any VM that includes it gets that `rand`.

Extracted from [bash0C7-homepage](https://github.com/bash0C7/bash0c7-homepage).

## Dependencies

- `picoruby-rng`

## Usage

```ruby
MRuby::Gem::Specification.new("your-gem") do |spec|
  spec.add_dependency "picoruby-securerandom", github: "bash0C7/picoruby-securerandom"
end
```

## License

MIT
