def newline()
	puts "\n"
end

# Question 1
# Using the given hash, find the total age of just the male members of the family
newline
puts "1)"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

male_total_ages = 0
munsters.each do |name, description|
	male_total_ages += description["age"] if description["gender"] == "male"
end

puts male_total_ages


# Question 2
# Given the previous hash, print out the name, age, and gender of each family member
newline
puts "2)"

munsters.each_pair do |name, description|
puts ("#{name} is a #{description['age']} year old #{description['gender']}.")
end

# Question 3
# In an earlier exercise we saw that depending on variables to be modified by called methods can be tricky.
# How can we refactor the given exercise to make the result easier to predict for the next programmer to maintain?
newline
puts "3)"

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

newline
# Refactor

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4
# Use String#split and String#join methods to break up the following string and put it back together in reverse word order
newline
puts "4)"

sentence = "Humpty Dumpty sat on a wall"

# Question 5
# What is the outut of the following code?
newline
puts "5)"

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The output is 34. Answer remains 42 until the end, therefore the output is (42-8)... which is 34

# Question 6
# Does the following code ransack the original family data or does it only mangle a local copy of the original hash? Why?
newline
puts "6)"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)

# The original munsters hash gets destroyed becuase the original hash is called in a destructive method instead
# of using a temporary hash.

# Question 7
# Given method rps, what is the result of the call statement
newline
puts "7)"

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# The output is "paper"
# If you carefully evaluate each iteration on the left side first we get "paper"
# then we have a final method call == rps("paper", "rock") which returns "paper"

# Question 8
# Consider the following methods, what would be the output of the the code bar(foo)
newline
puts "8)"

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)

# Method foo always returns "yes"
# therefore calling bar(yes) would return false and output "no"