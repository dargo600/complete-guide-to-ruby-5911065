#!/usr/bin/env ruby

require 'erb'
require 'csv'

APP_ROOT = File.expand_path(File.dirname(__FILE__))

def number_to_currency(value)
  sprintf('$%.2f', value.to_f)
end

# Read template file containing the overdue notice
template_path = File.join(APP_ROOT, 'overdue_notice.txt.erb')

# Read CSV file to get list of overdue notices
csv_file = File.join(APP_ROOT, 'overdue_list.csv')

# Read template file containing the overdue notice
template = File.read(template_path)

output_dir = File.join(APP_ROOT, "letters")
i = 1
# For each notice:
# Set instance variables as needed
# Use ERB to bind instance variables to the letter template
# Save results as separate files (e.g., "letters/overdue_01.txt")
CSV.foreach(csv_file, headers: true) do |row|
  # puts row["Last Name"]
  @borrowed_by = row["First Name"] + " " + row["Last Name"]
  @overdue_days = row["Days"].to_i
  @fee = number_to_currency(@overdue_days * 0.25)
  @book_title = row["Title"]

  # Use ERB to bind instance variables to the letter template
  output = ERB.new(template).result(binding)

  num = i < 10 ? "0#{i}" : i
  output_file = "overdue_#{num}.txt"
  output_file_name = File.join(output_dir, output_file)
  File.open(output_file_name, "w+") do |file|
    file.write(output)
  end
  i += 1
end

puts "\n#{i} overdue letters were generated in:"
puts output_dir
puts "\n"