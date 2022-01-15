SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length_meters = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width_meters = gets.chomp.to_f

area_sqmeters = (length_meters * width_meters).round(2)
area_sqfeet = (area_sqmeters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_sqmeters} (#{area_sqfeet} square feet)."
