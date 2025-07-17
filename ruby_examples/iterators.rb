
5.times {|n| puts n}

puts "---"

fruits = ['banana', 'apple', 'pear']

fruits.each do |fruit|
  puts fruit.capitalize
end

puts "---"

car = {
  'brand' => 'Ford', 
  'model' => 'Mustang', 
  'color' => 'blue', 
  'interior_color' => 'tan'
}

car.each do |k,v|
  puts "#{k}: #{v}"
end

puts "---"
vehicle = { brand: 'GM', tire_count: 2 }

vehicle.each do |k,v|
  puts "vehicle: #{k} : #{v}"
end

