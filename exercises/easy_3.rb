def newline()
	puts "\n"
end

# Question 1
# Show an easier way to write the given array
newline
puts "1)"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones
flintstones = %w( Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 2
# How can we add the family pet name "Dino" to our usual array
newline
puts "2)"

flintstones << "Dino"
p flintstones

# Question 3
# Using Array#concat and Array#push how can we add multiple items to an array (Dino and Hoppy)
newline
puts "3)"

flintstones = %w( Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones
flintstones = %w( Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")
p flintstones

# Question 4
# Shorten the following sentence by removing everything starting from "house"
newline
puts "4)"

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
advice_slice = advice.slice!(0,advice.index('house'))
puts advice_slice
puts advice

newline

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
advice_slice = advice.slice(0,advice.index('house'))
puts advice_slice
puts advice

# Question 5
# Write a one liner to count the number of lowercase 't' characters in the following string
newline
puts "5)"

statement = "The Flintstones Rock"
p statement.scan('t') # returns and array of all 't' characters
p statement.scan('t').count # returns a count of items in the array created by String#scan

# Question 6
# Align title assuming we have a 40 character wide table of Flintstone Family Members using spaces.
newline
puts "6)"

title = "Flintstone Family Members"

p title.center(40)
