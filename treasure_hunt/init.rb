#!/usr/bin/env ruby


# Challenge: Treasure Hunt
#
# Searches the hunt_dir for files containing "treasure"
#
# Outputs the file path when "treasure" is found
# Example:
# "Found treasure! buried_treasure/swamp/old_crate.txt"
    # Read from list file and display numbered list
$parent_dir = File.expand_path(File.dirname(__FILE__))

def search_file(file_path)
  unless File.exist?(file_path) 
    puts "Failed to find #{file_path}"
    return
  end
  data = File.read(file_path)
  if data.include?("treasure")
    new_path = file_path.gsub("#{$parent_dir}/", "")
    puts "Found treasure! #{new_path}"
  end
end
    
def find_treasure(file_path="")
  if File.directory?(file_path)
    Dir.foreach(file_path).each do |entry|
      next if entry.start_with?(".")
      abs_path = File.join(file_path, entry)
      if File.directory?(abs_path)
        find_treasure(abs_path)
      else
        search_file(abs_path)
      end
    end
  else
    search_file(file_path)
  end
end

search_dir = File.join($parent_dir, "buried_treasure")
puts "Processing #{search_dir}"
find_treasure(search_dir)