# frozen_string_literal: true

# 'a': 97
# 'z': 122

# 'A': 65
# 'Z': 90
class Cipher
  def self.shift_char(char, shift_val, is_cap)
    return (((char.ord - 97 + shift_val) % 26) + 97).chr unless is_cap

    (((char.ord - 65 + shift_val) % 26) + 65).chr
  end

  def self.cipher(string, shift_val)
    encrypted_string = ''
    string.split('').each do |char|
      char = shift_char(char, shift_val, false) if char.ord.between?(96, 123)
      char = shift_char(char, shift_val, true) if char.ord.between?(64, 91)
      encrypted_string += char
    end
    encrypted_string
  end
end

# puts cipher('Hello, World!', 3)