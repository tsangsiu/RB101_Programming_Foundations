def toggle(light)
  light == 0 ? 1 : 0
end

def toggle_lights(n)
  lights = [0] * n
  1.upto(n) do |round|
    lights.each_with_index do |light, index|
      lights[index] = toggle(light) if (index + 1) % round == 0
    end
  end
  lights
end

def which_lights_are_on(n)
  lights = toggle_lights(n)
  output = []
  lights.each_with_index do |light, index|
    output << (index + 1) if light == 1
  end
  output
end

# Further Exploration
=begin
1.
For a light at the position n, it's on after all toggling if it's toggled odd
number of times. At the i-th round of toggling, the light at the position n is
toggled if i is a factor of n. That means, if n has an odd number of factors,
the light at position n is on after all toggling. And square numbers are those 
numbers which have odd number of factors.

2.
We have to consider the position index of the lights very carefully, because
array index is counted from 0, while light position is counted from 1.
=end

# 3.
def which_lights_are_on(n)
  lights = toggle_lights(n)
  on_lights = []
  off_lights = []

  lights.each_with_index do |light, index|
    light == 1 ? on_lights << (index + 1) : off_lights << (index + 1)
  end

  on_lights = "#{on_lights[0...-1].join(', ')} and #{on_lights[-1]}"
  off_lights = "#{off_lights[0...-1].join(', ')} and #{off_lights[-1]}"

  "lights #{off_lights} are now off; #{on_lights} are on."
end

puts which_lights_are_on(5)
puts which_lights_are_on(10)
# puts which_lights_are_on(1000)
