# CRubyのSecureRandomのうち、`random_bytes`と`hex`。引数を省くと16バイト(CRubyと同じ)。
module SecureRandom
  HEX_DIGITS = "0123456789abcdef"

  def self.random_bytes(n = nil)
    RNG.random_string(n.nil? ? 16 : n.to_i)
  end

  # `unpack1("H*")`はmruby-packが要るので、1バイトずつ16進にする
  def self.hex(n = nil)
    bytes = random_bytes(n)
    result = ""
    i = 0
    while i < bytes.bytesize
      byte = bytes.getbyte(i)
      result << HEX_DIGITS[byte >> 4] << HEX_DIGITS[byte & 0x0f]
      i += 1
    end
    result
  end
end
