#!/usr/bin/env ruby

puts "-" * 15
puts "| Ruby Blanks |"
puts "-" * 15
puts

puts "You provide a list of words."
puts "I will use those words to fill in the blanks in a story."
puts

verbs = {}
adjectives = {}
nouns = {}

words = [ "verb", "adjective", "adjective", "noun" ]
values = []
answers = words.map do |word|
  print "Enter a #{word}: "
  response = gets.chomp
end


# I decided to <verb> a <adj> party for my <adj> <noun>
sentence = "I decided to #{answers[0]} a #{answers[1]} party for my #{answers[2]} #{answers[3]}."
puts sentence
