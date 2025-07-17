#!/usr/bin/env ruby

require 'date'

def isValidInt(val, val_type)
  unless val[0, 1] >= '0' && val[0,1] <= '9'
    abort("#{val_type} is not an Integer.  Detected #{val[0,1]}.  Aborting")
  end
  return val.to_i
end

week_day = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

puts "----------------------"
puts "| Birthdate Analysis |"
puts "----------------------"

print "What year were you born? "
birth_year = gets.chomp
birth_year = isValidInt(birth_year, "Birth Year")
print "What month were you born? "
birth_month = gets.chomp
birth_month = isValidInt(birth_month, "Birth Month")
print "What day of the month were you born? "
birth_day = gets.chomp
birth_day = isValidInt(birth_day, "Birth Day")

birth_date = Date.new(birth_year, birth_month, birth_day)

puts
puts "-------------------------------"
puts "You were born on a #{week_day[birth_date.wday]}"
puts "It was the #{birth_date.yday} day of the year."
puts "It was the #{birth_date.cweek} week of the year."
puts "You were#{birth_date.leap? ? '' : ' not'} born in a leap year."
