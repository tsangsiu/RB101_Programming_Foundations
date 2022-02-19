ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_sum = 0
ages.each do |name, age|
  ages_sum += age
end       
p ages_sum

p ages.values.sum

p ages.values.reduce(:+) 
