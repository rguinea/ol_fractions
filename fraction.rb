require "./math.rb"

class Fraction
  include Math
  attr_reader :num, :den
  attr_writer :num, :den
  def initialize(fraction)
  	if fraction.length > 0
    	@num, @den = parse_fraction(fraction)
    end
  end
  
  def to_s()
    return to_proper_fraction(@num, @den)
  end

  private
  def to_proper_fraction(num, den)
    if den == 0
    	return "0"
    end
    gcd = get_gcd(num, den)
    num /= gcd
    den /= gcd
    whole = num / den

    if whole != 0 and whole != -1
      if den == 1
        return whole.to_s
      end
      if whole < 0
      	# integer division rounds the number down which doesn't work with neg numbers 
      	whole += 1
      end
      num %= den
      return "#{whole}_#{num}/#{den}"
    end
    if num == 0
    	return num.to_s
    end
    return "#{num}/#{den}"
  end
  
  def to_improper_fraction(numerator, denominator)
    # transforms two strings to an improper fraction
    # numerator is expected in the form 5_1 where 5 is the whole part
    # and 1 is the numerator of the fraction
    den = denominator.to_i
    if numerator.include? "_"
      proper_fraction = numerator.split("_")
      if proper_fraction[0] == "-0"
      	num = -1 * proper_fraction[1].to_i
      else
      	whole = proper_fraction[0].to_i
      	num = proper_fraction[1].to_i
      	sign = whole < 0 ? -1 : 1 
      	num = whole * den + sign * num
      end
    else
      num = numerator.to_i
    end
    return num, den
  end
  
  def parse_fraction(string)
    # parses a string in the form "5_1/2" and returns the numerator and denominator
    # of the fraction or raises an error
    numbers = string.split("/")
    unless numbers.length == 1 or numbers.length == 2
      raise "Bad input"
    end

    begin
    	num = numbers[0]
    	den = numbers.length == 2 ? numbers[1] : 1
      return to_improper_fraction(num, den)
    rescue
      raise "Bad input"
    end
  end
end
