require "./math.rb"

module FractionMath
  include Math
	def do_fraction_math(x, y, operator)
		if operator == "+"
		  return sum_fractions(x, y)
		elsif operator == "-"
		  y.num = -1 * y.num
		  return sum_fractions(x, y)
		elsif operator == "*"
		  return multiply_fractions(x, y)
		elsif operator == "/"
			y.num, y.den = y.den, y.num
		  return multiply_fractions(x, y)
		end	
		raise "Illegal operation :/"
	end

  private
  def sum_fractions(x, y)
    lcm = get_lcm(x.den, y.den)
    num = (x.num * lcm / x.den) + (y.num * lcm / y.den)
    return create_fraction num, lcm
  end

  def multiply_fractions(x, y)
    num = x.num * y.num
    den = x.den * y.den
    return create_fraction num, den
  end
  def create_fraction(num, den)
    result = Fraction.new("")
    result.num = num
    result.den = den
    result
  end
end
