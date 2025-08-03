#!/usr/bin/env ruby


require_relative 'classes/dice'
require_relative 'classes/dice_four'
require_relative 'classes/dice_eight'
require_relative 'classes/dice_ten'
require_relative 'classes/dice_twelve'
require_relative 'classes/dice_twenty'

dice_sizes = {
   4 => DiceFour.new,
   6 => Dice.new,
   8 => DiceEight.new,
   10 => DiceTen.new,
   12 => DiceTwelve.new,
   20 => DiceTwenty.new
}

def status(dice)
   "\nd#{dice.sides}: #{dice.display}"
end

dice = Dice.new

puts "Dungeon Dice Roller"
puts "-" * 25
puts

puts status(dice)

response = nil
loop do
  puts
  puts "Type 'r' for roll, 'c' to change size or 'q' for quit"
  response=gets.chomp
  if response == 'q'
     break
  elsif response == 'c'
   puts "\nAvailable sizes: #{dice_sizes.keys.join(', ')}"
   print '> '
   desired_size = gets.chomp
   new_dice = dice_sizes[desired_size.to_i]
   if new_dice.nil?
      puts "Invalid size"
   else
      dice = new_dice
      dice.roll
      puts status(dice)
   end
  elsif response == 'r'
     dice.roll
     puts status(dice)
  end
end
