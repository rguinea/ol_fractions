require "./fraction_math"
require "./fraction"

include FractionMath

def parse_input(string)
  inputs = string.split(" ")
  if inputs.length != 3
    raise "Bad input"
  end
  
  return inputs[0], inputs[1], inputs[2]
end

def ask_user_for_input
	[(puts "Type 'x' to exit. Set your input here:"), gets.rstrip][1]
end

input = ask_user_for_input
while input != "x" do
	begin
		input1, input2, input3 = parse_input input
		fraction1 = Fraction.new(input1)
		fraction2 = Fraction.new(input3)
		print "#{fraction1.to_s} #{input2} #{fraction2.to_s} = "
		result = do_fraction_math(fraction1, fraction2, input2)
		puts result.to_s
	rescue Exception => ex
	  puts "An error of type '#{ex.class}' happened, message is '#{ex.message}'"
	  puts "Try again"
	end
	input = ask_user_for_input
end
puts "Goodbye. I'll miss you :("
