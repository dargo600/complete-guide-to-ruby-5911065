colors = "RRGGBBYYKK"

chars = colors.chars
i = 0
20.times do |n|
  first = chars.shift
  chars.push(first)
  puts "#{chars.join("")}"
end