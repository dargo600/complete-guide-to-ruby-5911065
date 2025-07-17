#!/usr/bin/env ruby

MAX_GUESSES = 3
desired_num = [*1..10].shuffle.first

puts "----------------------"
puts "| Guessing Game      |"
puts "----------------------"

print "What is your name? "
name = gets.chomp
print "Hello #{name}!  Time to play a guessing game\n"
puts "What is max value you want to guess up to?"
print "> "
max_value = gets.chomp
unless max_value[0, 1] >= '0' && max_value[0,1] <= '9'
  abort("Value is not an Integer.  Aborting #{max_value[0]}")
end
max_value = max_value.to_i
if max_value <= 0
  abort("Value needs to be greater than 0\nDetected value is #{max_value.to_s}.\nExiting")
end
puts "Ok values can be from 1 to #{max_value}."
desired_num = rand(max_value) + 1
puts "You have #{MAX_GUESSES} guesses."
match_found = false
1.upto(MAX_GUESSES) do |guess_number|
  print "\nEnter Guess #{guess_number}: "
  guess = gets.chomp
  guess = guess.to_i
  if guess == desired_num
    puts "Found Match of #{guess}"
    match_found = true
    break
  elsif guess < desired_num
    puts "Guess should be higher"
  else
    puts "Guess should be lower"
  end
end
if match_found == false
  puts "Could not find match value was #{desired_num}"
end
puts "GoodBye"