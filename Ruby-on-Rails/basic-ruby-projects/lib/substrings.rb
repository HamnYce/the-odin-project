# frozen_string_literal: true

def substrings(string, dictionary)
  answer_hash = Hash.new(0)
  string.split.each do |substring|
    dictionary.each do |word|
      answer_hash[word] += 1 if substring.downcase.include? word.downcase
    end
  end
  answer_hash.sort_by { |key, _value| key }.to_h
end
