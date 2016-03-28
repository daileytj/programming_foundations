def newline()
	puts "\n"
end

# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?
newline
puts "1)"

if false
  greeting = “hello world”
end

greeting

# The statement evaluates to true, therefore greeting is never set to anything and will return nil

# Question 2
# What is the result of the last line in the code below?
newline
puts "2)"

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => {:a=>"hi there"}

# The original object is changed therefore;
# The output is {:a=>"hi there"} because informal_greeting is a reference to the original object. 
# The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. 

# Question 3
# What will be printed by each of these code groups?
newline
puts "3)"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

newline

#B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

newline

#C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# A) and B) return one is one, two is two, and three is three.
# Because none of the methods called are destructive and the puts call at the end refers to the original object
# C) returns one is "two", two is "three", and three is "one" because the String#gsub! method is destructive
# and the inner method variables reference the original objects.

# Question 4
# Each UUID consists of 32 hexadecimal characters,
# and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
#Write a method that returns one UUID when called with no parameters.
newline
puts "4)"

def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  puts uuid
end

generate_UUID()

# Question 5
=begin

Ben was tasked to write a simple ruby method to determine if an input string 
is an IP address representing dot-separated numbers. e.g. "10.4.5.11". 
He is not familiar with regular expressions. 
Alyssa supplied Ben with a method called is_a_number? to determine if a string is a number and asked Ben to use it.
Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. 
You're not returning a false condition, and not handling the case that there are more or fewer than
4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

=end
newline
puts "5)"

def is_a_number?(input)
	if Float(input)
		true
	else
		false
	end
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if ! is_a_number?(word)
  end
  return true
end

# refactor

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

if dot_separated_ip_address?("21.4.56.76")
	puts "true"
else
	puts "false"
end

if dot_separated_ip_address?("21.56.76")
	puts "true"
else
	puts "false"
end

if dot_separated_ip_address?("21.4.56.76.87")
	puts "true"
else
	puts "false"
end
if dot_separated_ip_address?("0.0.0.0")
	puts "true"
else
	puts "false"
end



