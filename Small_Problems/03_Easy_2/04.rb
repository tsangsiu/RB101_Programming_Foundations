print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
age_retire = gets.chomp.to_i

year_now = Time.now.year
years_work = age_retire - age
year_retire = year_now + years_work

puts "It's #{year_now}. You will retire in #{year_retire}."
puts "You have only #{years_work} years of work to go!"
