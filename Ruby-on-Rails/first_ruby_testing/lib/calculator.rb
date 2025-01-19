# Frozen_String_Literal: true

# Calculator class
class Calculator
  def add(*a)
    a.reduce(:+)
  end

  def subtract(*a)
    a.reduce(:-)
  end

  def multiply(*a)
    a.reduce(:*)
  end

  def divide(*a)
    begin
      a.reduce(:/)
    rescue
      'MathError'
    end
  end
end
