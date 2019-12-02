require 'pry'
class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side_1, side_2, side_3)
    @side1 = side_1
    @side2 = side_2
    @side3 = side_3
  end

  def sides_greater_than_zero?
    @side1 > 0 && @side2 > 0 && @side3 > 0
  end

  def equilateral?
    @side1 == @side2 && @side2 == @side3 && valid_sides?
  end

  def isosceles?
    (@side1 == @side2 || @side2 == @side3 || @side3 == @side1) && valid_sides?
  end

  def valid_sides?
    # binding.pry
    valid  = true
    if @side1 + @side2 <= @side3
      valid = false
    end

    if @side2 + @side3 <= @side1
      valid = false
    end

    if @side3 + @side1 <= @side2
      valid = false
    end
    valid && sides_greater_than_zero?
  end

  def kind
    if valid_sides? && equilateral?
      return :equilateral
    elsif valid_sides? && isosceles?
      return :isosceles
    elsif valid_sides?
      return :scalene
    else
      begin
        raise TriangleError
      # rescue
      end
    end
  end

  class TriangleError < StandardError

  end
end
