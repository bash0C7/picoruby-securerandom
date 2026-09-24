# picoruby-securerandom: CRubyの標準添付ライブラリSecureRandomのPicoRuby版(サブセット)。
# CRubyのSecureRandomがOSの乱数(`Random.urandom`)から取るのと同じく、PicoRubyの
# 乱数(picoruby-rngの`RNG.random_string`。POSIXではOS、マイコンではそのハードウェア)から取る。
#
# picoruby-rngは`Kernel#rand`も定義し直す(`RNG.random_int % max`)。これを入れたVMでは
# `rand`がそれになる。
MRuby::Gem::Specification.new("picoruby-securerandom") do |spec|
  spec.license = "MIT"
  spec.author = "bash0C7"
  spec.summary = "SecureRandom for PicoRuby"
  spec.add_dependency "picoruby-rng"
end
