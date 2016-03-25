def newline()
	puts "\n"
end

# Question 3
# Replace the word "important" with "urgent" in this string
newline()
puts "3)"

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

puts("Advice: #{advice}")

# Question 4
# How do the delete.at() and delete() methods differ?
newline()
puts "4)"

numbers = [1,2,3,4,5]
numbers.delete_at(1)
p numbers

numbers = [1,2,3,4,5]
numbers.delete(1)
p numbers 

# Question 5
# Programmatically determine if 42 lies between 10 and 100
newline()
puts "5)"

if (10..100).cover?(42)
	puts "42 lies between 10 and 100"
end
if (10..100).include?(42)
	puts "42 lies between 10 and 100"
end

# Question 6
# Starting with the given string show two different ways to prepend the expected text.
newline()
puts "6)"

famous_words = "seven years ago..."

puts "Four score and " + famous_words
puts "Four score and " << famous_words
famous_words.prepend("Four score and ")

# Question 7
newline()
puts "7)"

def add_eight(number)
	number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

puts eval(how_deep)

# Question 8
# From given nested array, create an un-nested array.
newline()
puts "8)"

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones

unnested_flintstones = flintstones.flatten

p unnested_flintstones

# Question 9
# From the given hash create an array with only two elements: Barney's name and Barney's number
newline()
puts "9)"

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")

# Question 10
# Turn the given array into a hash where the names are the keys and the values are the position in the array
newline()
puts "10)"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
	flintstones_hash[name] = index
end

p flintstones_hash
