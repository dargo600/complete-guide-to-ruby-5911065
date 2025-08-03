#!/usr/bin/env ruby


require_relative 'classes/dice'
require_relative 'classes/diceset'

dice_set = DiceSet.new

puts "Welcome to the Dice Roller"
puts "-" * 26
puts

puts dice_set.display

loop do 
  puts
  puts "Type 'r' for roll or 'q' for quit"
  roll=gets.chomp
  if roll == 'q'
     break
  end
  if roll == 'r'
     dice_set.roll
     puts dice_set.display
   end
end
