module ListMaker
  require "fileutils"
  class ListFile

    @@filename = 'lm_list.txt'
    @@full_file_path = ''

    def initialize
      # locate list file in APP_ROOT
      # confirm that file is readable and writable
      # or create a new file in APP_ROOT
      # if success, return self, otherwise exit program
      @@full_file_path = File.join(APP_ROOT, @@filename)
      unless File.exist?(@@full_file_path)
        File.open(@@full_file_path, 'w+') do |file|
          file.write('')
        end
      end
      unless File.readable?(@@full_file_path)
        raise IOError, "File is not readable #{full_file_path}"
      end
      unless File.writable?(@@full_file_path)
        raise IOError, "File is not writable #{full_file_path}"
      end
      self
    end

    # Read from list file and display numbered list
    def view
      puts "\nView List\n".upcase
      line_count = 0
      File.open(@@full_file_path, 'r') do |file|
        file.each_line do |line|
          puts "#{file.lineno}: #{line}"
          line_count = line_count + 1
        end
      end
      if line_count == 0
        puts "<< Empty List >>"
      end
    end
    
    # Add item to the end of the list file
    def add
      puts "\nAdd a List Item\n\n".upcase
      print "\nEnter a new item: "
      input = gets
      File.open(@@full_file_path, 'a') do |file|
        file.write(input)
      end
      puts "List item added."
    end

    # Edit list item with the given position number
    # Prompts for replacement text
    def edit(position)
      puts "\nEdit List\n\n".upcase
      tmp_file = "temp.out"
      fout = File.open(tmp_file, 'w+')
      File.open(@@full_file_path, 'r') do |file|
        file.each_line.each_with_index do |line, index|
          line_number = index + 1
          if line_number == position.to_i
            puts "#{line_number}: #{line.chomp}"
            print "\nEnter new text:"
            input = gets.chomp
            fout.write(input + "\n")
          else
            fout.write(line)
          end
        end
      end
      fout.close
      FileUtils.cp_r(tmp_file, @@full_file_path)
    end
    
    # Delete list item with the given position number
    def delete(position)
      tmp_file = "temp.out"
      fout = File.open(tmp_file, 'w+')
      File.open(@@full_file_path, 'r') do |file|
        file.each_line.each_with_index do |line, index|
          line_number = index + 1
          if line_number != position.to_i
            fout.write(line)
          else
            puts "Removing #{line_number}: #{line}"
          end
        end
      end
      fout.close
      FileUtils.cp_r(tmp_file, @@full_file_path)
    end
    
  end
end
