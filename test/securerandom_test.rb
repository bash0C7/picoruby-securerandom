# picoruby-securerandom(mrblib/securerandom.rb)。
# 乱数はpicoruby-rngから取る(host VMはstdlib.gemboxでRNGを持つ)。
class SecureRandomTest < Picotest::Test
  def test_random_bytes_defaults_to_16_bytes
    assert_equal(16, SecureRandom.random_bytes.bytesize)
    assert_equal(32, SecureRandom.random_bytes(32).bytesize)
  end

  def test_hex_is_twice_the_byte_length_in_lowercase_hex
    hex = SecureRandom.hex(64)
    assert_equal(128, hex.length)
    i = 0
    while i < hex.length
      assert(SecureRandom::HEX_DIGITS.include?(hex[i]))
      i += 1
    end
    assert_equal(32, SecureRandom.hex.length)
  end

  def test_two_calls_differ
    assert_not_equal(SecureRandom.hex, SecureRandom.hex)
  end
end
