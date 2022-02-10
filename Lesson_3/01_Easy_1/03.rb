advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.gsub('important', 'urgent')
advice = advice.gsub(/important/, 'urgent')

puts advice
