module Math
  def get_lcm(x, y)
    # get the least common multiple of two numbers   
    return ((x * y) / get_gcd(x, y)).abs
  end

  def get_gcd(x, y)
    # get the greatest common divisor of two numbers
     while y != 0
        x, y =	y, x % y
     end
     return x.abs
  end
end
