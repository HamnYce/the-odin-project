# spec/cipher_spec.rb

require './lib/cipher'

RSpec.describe Cipher do
  subject { Cipher }

  describe '.cipher' do
    context 'when letters are lower case' do
      it 'shifts all characters to the right by 1' do
        expect(subject.cipher('abcd', 1)).to eql('bcde')
      end

      it 'rotates past z into a' do
        expect(subject.cipher('abwxyz', 5)).to eq('fgbcde')
      end

      it 'accepts and ignores numbers' do
        expect(subject.cipher('1abc54z', 2)).to eq('1cde54b')
      end
    end

    context 'when letters are upper case' do
      it 'shifts all characters to the right by 1' do
        expect(subject.cipher('ABCD', 1)).to eql('BCDE')
      end

      it 'rotates past Z into A' do
        expect(subject.cipher('ABWXYZ', 5)).to eq('FGBCDE')
      end

      it 'accepts and ignores numbers' do
        expect(subject.cipher('1ABC54Z', 2)).to eq('1CDE54B')
      end
    end

    context 'when letters are mixed case' do
      it 'shifts all characters to the right by 1' do
        expect(subject.cipher('aBcD', 1)).to eql('bCdE')
      end

      it 'rotates past z into a' do
        expect(subject.cipher('AbwXyZ', 5)).to eq('FgbCdE')
      end

      it 'accepts and ignores numbers' do
        expect(subject.cipher('1abC54Z', 2)).to eq('1cdE54B')
      end
    end
  end
end
