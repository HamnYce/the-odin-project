#spec/calculator_spec.rb

require './lib/calculator'

describe Calculator do
  subject { Calculator.new }

  describe '#add' do
    it 'returns the sum of two numbers' do
      expect(subject.add(5, 2)).to eql(7)
    end

    it 'returns the sum of more than two numbers' do
      expect(subject.add(5, 2, 7)).to eql(14)
    end
  end

  describe '#subtract' do
    it 'returns the difference of two numbers' do
      expect(subject.subtract(5, 2)).to eql(3)
    end

    it 'returns negative number' do
      expect(subject.subtract(2, 5)).to eql(-3)
    end

    it 'returns the difference of more than 2 numbers' do
      expect(subject.subtract(1, 3, 4)).to eql(-6)
    end
  end

  describe '#multiply' do
    it 'returns the product of 2 numbers' do
      expect(subject.multiply(5, 7)).to eql(35)
    end

    it 'returns the product of more than 2 numbers' do
      expect(subject.multiply(2, 3, 4)).to eql(24)
    end
  end

  describe '#divide' do
    it 'returns the division of 2 numbers' do
      expect(subject.divide(8, 2)).to eql(4)
    end

    it 'return \'MathError\' when dividing by 0' do
      expect(subject.divide(2, 0)).to eql('MathError')
    end

    it 'returns the division of more than 2 numbers' do
      expect(subject.divide(2.0, 8, 9)).to eql(1 / 36.0)
    end
  end
end
