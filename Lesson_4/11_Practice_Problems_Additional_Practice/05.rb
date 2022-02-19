flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

desired_index = nil
flintstones.each_with_index do |name, index|
  desired_index = index if name.start_with?('Be')
end
p desired_index

p (flintstones.index do |name|
  name.start_with?('Be')
end)
