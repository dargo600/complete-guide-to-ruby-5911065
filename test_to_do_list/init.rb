#!/usr/bin/env ruby
require_relative 'classes/to_do_list'

list = LIL::ToDoList.new(['dishes', 'nap', 'laundry', 'vaccuum'])

puts "Count #{list.count}"
puts "First: #{list.first}"
puts "Last: #{list.last}"
puts "Tasks longer than 6 #{list.find{|i| i.length > 6}}"
list << "sleep"
puts "First: #{list.first}"

puts "Updated List: #{list.map{|i| i.capitalize}}"

puts "Sorted:"
list.sort.each_with_index do |item, i|
  puts "#{i+1}: #{item}"
end
