def newline()
	puts "\n"
end

newline

# Question 1
# Using the given hash, see if there is an age present for "spot"
puts "1)"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")

# Question 2
# Add up all of the ages from our current Munster family hash
newline
puts "2)"

total_ages = ages.values.inject(:+)
puts total_ages

# Question 3
# Throw out anyone over 100
newline
puts "3)"

ages.keep_if { |name, age| age < 100}
p ages

# Question 4
# Use given string to convert into various other given strings
newline
puts "4)"

munsters_description = "The Munsters are creepy in a good way"

puts munsters_description.capitalize!
puts munsters_description.swapcase!
puts munsters_description.downcase!
puts munsters_description.upcase!

# Question 5
# Add ages for Marilyn and Spot to the existing hash
newline
puts "5)"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10}
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages

# Question 6
# Pick out the minimum age from our current Munster family hash
newline
puts "6)"

ages = {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}

minimum_age = ages.values.min
puts minimum_age

# Question 7
# See if the word "Dino" appears in the string below
newline
puts "7)"

advice = "Few things in life are as important as house training your pet dinosaur."
if advice.match("Dino")
	puts "it's a match"
else
	puts "it's not a match"
end

# or

puts advice.include?("Dino")

# Question 8
# In the given array fint the index of the first name that starts with "Be"
newline
puts "8)"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts "index of the first name that starts with 'Be' is " + flintstones.index { |name| name[0, 2] == "Be"}.to_s

# Question 9
# Using array#map!, shorten each of these names to just 3 characters.
newline
puts "9)"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
	name[0, 3]
end

p flintstones

# Question 10
# Using array#map!, shorten each of these names to just 3 characters, but do it on one line.
newline
puts "10)"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones