def newline()
	puts "\n"
end

# Question 1
# Write a one line program that creates an output of "The Flintstones Rock" 10 times
# with subsequent lines indented 1 space to the right
newline
puts "1)"

string = "The Flintstones Rock!"

10.times { |number| puts (" " * number) + string }

# Question 2
# Create a hash that expresses the frequency with which each letter occurs in the following string
newline
puts "2)"

statement = "The Flintstones Rock"

result  = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
p letters

letters.each do |letter|
	letter_frequency = statement.scan(letter).count
	result[letter] = letter_frequency if letter_frequency > 0
end

newline
p result

# Question 3
# The result of the following statement will be an error. Why?
newline
puts "3)"

# puts "the value of 40 + 2 is " + (40 + 2)
# The error returns no implicit conversion of Fixnum into String (TypeError)
# This happens because (40 + 2) results an integer but is added as a string

puts "the value of 40 + 2 is " + (40 + 2).to_s

#or 

puts "the value of 40 + 2 is #{ 40 + 2 }"

# Question 4
# What happens when we modify an array while iterating over it? What would be the output of the following codes?
newline
puts "4)"

numbers = [1,2,3,4]
numbers.each do |number|
	p numbers
	p number
	numbers.shift(1)
	newline
end

# returns 1 and 3
# The removal of the first item in the first pass changes the value found for the second pass

newline

numbers = [1,2,3,4]
numbers.each do |number|
	p numbers
	p number
	numbers.pop(1)
	newline
end

# returns 1 and 2
# The array is shortened after each pass. The items removed are beyond the point we are sampling in the loop

# In both cases we are not working on the original array but a destructed, real-time version of the array.

	
# Question 5
# The following method fails if you input a 0 or negative number. How can we change the loop construct to make it work?
newline
puts "5)"

def factors(number)
	dividend = number
	divisors = []
	begin
		divisors << number / dividend if number %dividend == 0
		dividend -= 1
	end until dividend == 0
	divisors
end

def factors_refactored(number)
	dividend = number
	divisors = []
	while dividend > 0
		divisors << number /dividend if number % dividend == 0
		dividend -= 1
	end
	divisors
end

p factors(1)
# p factors(-10) creates endless loop / freezes program
# p factors(0) returns: divided by 0 (ZeroDivisionError)
p factors (5)

newline

p factors_refactored(1)
p factors_refactored(-10)
p factors_refactored(0)
p factors_refactored(5)

# What is the purpose of the "number % dividend == 0"?
# This lets  you determine if the result of the division is an integer without a remainder
# What is the purpse of the second-to-last line in the methos (the "divisors") before the method's end?
# This is the return statement as the last value called in a method will be the return value.

# Question 6
# Here are two implementations of a rolling buffer
# Elements are added to the rolling buffer and if the buffer becomes full,
# the new elements that are added will displace the oldest elements in the buffer
# We can us "+" or "<<" for modifying the buffer. Which do you choose? Is there a difference between the two?
newline
puts "6)"

def rolling_buffer1(buffer, max_buffer_size, new_element)
	buffer << new_element
	buffer.shift if buffer.size >= max_buffer_size
	buffer
end
 
def rolling_buffer2(input_array, max_buffer_size, new_element)
	buffer = input_array + [new_element]
	buffer.shift if buffer.size >= max_buffer_size
	buffer
end

=begin
Yes, there is a difference. Both methods will return the same value. 
In rolling_buffer1 the input argument called buffer will be modified and will end up being changed
after rolling_buffer1 returns. The callers input array will be altered from the original that was passed
In rolling_buffer2 the callers input argument will not be altered
=end

# Question 7
# Here is a basic implementation for a Fibonacci calculator, a user passes in two numbers
# and the calculator will keep computing the sequence until some limit is reached.
# There is an error in the code. Something about the limit variable. Whats wrong with the code?
newline
puts "7)"

def fib(first_num, second_num, limit)
	while second_num < limit
		sum = first_num + second_num
		first_num = second_num
		second_num = sum
	end
	sum
end

result = fib(0,1,15)
puts "result is #{result}"

# The original method did not work because the limit was defined before fib is called. 
# Limit is not available in the scope of the method. 
# I altered the method by adding limit as an argument to the method.

newline

def fibonacci(first_num, second_num, limit, num_to_fib)
	fib_array = []
	while second_num < limit
		sum = first_num + second_num
		first_num = second_num
		second_num = sum
		fib_array << sum 
	end
	if num_to_fib == 0
		return 0
	elsif num_to_fib == 1 || num_to_fib == 2
		return 1
	else
	  fib_array[num_to_fib - 2]
	end
end

p fibonacci(0,1,500,0)
p fibonacci(0,1,500,1)
p fibonacci(0,1,500,2)
p fibonacci(0,1,500,3)
p fibonacci(0,1,500,4)
p fibonacci(0,1,500,5)
p fibonacci(0,1,500,6)
p fibonacci(0,1,500,7)
p fibonacci(0,1,500,8)

# Question 8
# Create "titleize!", a method provided in ruby on rails that creates a string that has each word capitalized
# as it would be in a title. 
newline
puts "8)"

def titleize(words)
words.split.map { |word| word.capitalize }.join(' ')
end

p titleize("the hunt for red october")
p titleize("all dogs go to heaven")

# Question 9
# Given the following hash, Modify the hash such that each member of the Munster family has an additional
# age_group key that has one of 3 values describing the age group the family member is in (kid, adult, senior)
newline
puts "9)"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
	case details["age"]
	when 0..18
		details["age_group"] = "kid"
	when 18..65
		details["age_group"] = "adult"
	else
		details["age_group"] = "senior"
	end
end

puts munsters