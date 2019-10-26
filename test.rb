require './math'
require './fraction'
require './fraction_math'
require 'test/unit'

include Math
include FractionMath
 
class MathTest < Test::Unit::TestCase
  def test_get_gcd
    assert_equal 1, get_gcd(1, 1)
    assert_equal 6, get_gcd(54, 24)
    assert_equal 8, get_gcd(-8, 16)
    assert_equal 8, get_gcd(-8, -16)
    assert_equal 8, get_gcd(8, -16)
    assert_equal 5, get_gcd(0, 5)
    assert_equal 16, get_gcd(16, 0)
    assert_equal 0, get_gcd(0, 0)
    assert_equal 8, get_gcd(987124578123488, 9812340812349871230984)
    assert_raise TypeError do
		  get_gcd("1", 16)
		end
    assert_raise TypeError do
		  get_gcd(1, "16")
		end
  end
  def test_get_lcm
    assert_equal 1, get_lcm(1, 1)
    assert_equal 20, get_lcm(4, 20)
    assert_equal 51, get_lcm(3, 17)
    assert_equal 40, get_lcm(-8, 20)
    assert_equal 40, get_lcm(8, -20)
    assert_equal 0, get_lcm(0, 5)
    assert_equal 0, get_lcm(16, 0)
    assert_equal 1210750348099343771184360302915469024, get_lcm(987124578123488, 9812340812349871230984)
    assert_raise ZeroDivisionError do
		  get_lcm(0, 0)
		end
    assert_raise TypeError do
		  get_lcm("1", 16)
		end
    assert_raise TypeError do
		  get_lcm(1, "16")
		end
  end 
end

class FractionTest < Test::Unit::TestCase
  def test_init_fraction
    assert_equal 11, Fraction.new("5_1/2").num
    assert_equal 2, Fraction.new("5_1/2").den
    assert_equal 1, Fraction.new("0_1/2").num
    assert_equal 2, Fraction.new("0_1/2").den
    assert_equal -1, Fraction.new("-0_1/2").num
    assert_equal 2, Fraction.new("-0_1/2").den
    assert_equal 11, Fraction.new("11/2").num
    assert_equal 2, Fraction.new("11/2").den
    assert_equal -11, Fraction.new("-11/2").num
    assert_equal 2, Fraction.new("-11/2").den
    assert_equal -11, Fraction.new("-11").num
    assert_equal 1, Fraction.new("-11").den
    assert_equal 0, Fraction.new("0").num
    assert_equal 1, Fraction.new("0").den
    assert_equal nil, Fraction.new("").num
    assert_equal nil, Fraction.new("").den
    assert_raise NoMethodError do
    	Fraction.new(0)
    end
  end 
  def test_fraction_to_s
    assert_equal "5_1/2", Fraction.new("5_1/2").to_s
    assert_equal "5_1/2", Fraction.new("11/2").to_s
    assert_equal "-5_1/2", Fraction.new("-11/2").to_s
    assert_equal "-1/2", Fraction.new("-1/2").to_s
    assert_equal "-1/999999999999999999", Fraction.new("-1/999999999999999999").to_s
    assert_equal "1/999999999999999999", Fraction.new("1/999999999999999999").to_s
    assert_equal "1/999999999999999999", Fraction.new("0_1/999999999999999999").to_s
    assert_equal "-1/999999999999999999", Fraction.new("-0_1/999999999999999999").to_s
    assert_equal "1/2", Fraction.new("1/2").to_s
    assert_equal "-11", Fraction.new("-11").to_s
    assert_equal "11", Fraction.new("11").to_s
    assert_equal "11", Fraction.new("11/1").to_s
    assert_equal "-11", Fraction.new("-11/1").to_s
    assert_equal "0", Fraction.new("0/11234").to_s
    assert_equal "2", Fraction.new("10/5").to_s
    assert_equal "-2", Fraction.new("-10/5").to_s
  end 
end

class FractionMathTest < Test::Unit::TestCase
  def test_fraction_sum
		helper = FractionHelper.new	
  	assert helper.do_operation("1/2", "+", "1/2").equals("2/2")
  	assert helper.do_operation("1/2", "+", "1/-2").equals("0")
  	assert helper.do_operation("1/2", "+", "-1/-2").equals("2/2")
  	assert helper.do_operation("1_1/2", "+", "1/2").equals("4/2")
  	assert helper.do_operation("1/2", "+", "0_1/2").equals("2/2")
  	assert helper.do_operation("1/2", "+", "-0_1/2").equals("0/2")
  	assert helper.do_operation("-1/2", "+", "0_1/2").equals("0/2")
  	assert helper.do_operation("1/19", "+", "1/23").equals("42/437")
  	assert helper.do_operation("-1/19", "+", "1/23").equals("-4/437")
  	assert helper.do_operation("-0_1/19", "+", "-0_1/21").equals("-40/399")
  	assert helper.do_operation("-166_1/17", "+", "88237_1/21").equals("88070_353/357")
  	assert helper.do_operation("-166_1/17", "+", "88237_1/21").equals("31441343/357")
  	assert helper.do_operation("-165_18/17", "+", "88235_43/21").equals("31441343/357")
  	assert helper.do_operation("0/1", "+", "1/2").equals("1/2")
  	assert helper.do_operation("0/1", "+", "0/2000000").equals("0")
  	assert helper.do_operation("0/1", "+", "-0/2000000").equals("0")
  	assert helper.do_operation("-0/1", "+", "-0/2000000").equals("0")
  	assert helper.do_operation("-0/1", "+", "-1/2000000").equals("-1/2000000")
  	assert helper.do_operation("1", "+", "-1/10").equals("9/10")
  	assert helper.do_operation("-1", "+", "1/10").equals("-9/10")
  	assert helper.do_operation("16", "+", "17").equals("33")
  end
  def test_fraction_minus
		helper = FractionHelper.new	
  	assert helper.do_operation("1/2", "-", "1/2").equals("0/2")
  	assert helper.do_operation("1/2", "-", "-1/2").equals("1")
  	assert helper.do_operation("-1/2", "-", "-1/2").equals("0")
  	assert helper.do_operation("2", "-", "2").equals("0")
  end
  def test_fraction_times
		helper = FractionHelper.new	
  	assert helper.do_operation("1/2", "*", "1/2").equals("1/4")
  	assert helper.do_operation("1/19", "*", "1/23").equals("1/437")
  	assert helper.do_operation("0/19", "*", "1/23").equals("0")
  	assert helper.do_operation("8", "*", "8").equals("64")
  	assert helper.do_operation("8", "*", "-8").equals("-64")
  	assert helper.do_operation("-8", "*", "-8").equals("64")
  	assert helper.do_operation("1_1/4", "*", "1_1/2").equals("1_7/8")
  	assert helper.do_operation("1_5/4", "*", "1_1/2").equals("3_3/8")
  	assert helper.do_operation("1_5/4", "*", "-1_1/2").equals("-3_3/8")
  	assert helper.do_operation("91234949_5/1234895", "*", "12341234_1/2").equals("1125951900204590_115774/246979")
  end
  def test_fraction_by
		helper = FractionHelper.new	
  	assert helper.do_operation("1/2", "/", "1/2").equals("2/2")
  	assert helper.do_operation("1/19", "/", "1/23").equals("1_4/19")
  	assert helper.do_operation("1/19", "/", "1/23").equals("23/19")
  end
end
class FractionHelper
  def equals(x)
  	x = Fraction.new(x)
  	if @result.to_s != x.to_s and (x.num != @result.num or x.den != @result.den)
  		raise "Expected #{x.to_s} to match #{@result}\n#{x.num} != #{@result.num} or #{x.den} != #{@result.den}"
	  end
  	true
  end

  def do_operation(x, operation, y)
  	x = Fraction.new(x)
  	y = Fraction.new(y)
		@result = do_fraction_math(x, y, operation)
  	self
  end
end
