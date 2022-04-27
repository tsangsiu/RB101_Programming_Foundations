=begin

Problem
- Rules:
  - You have a bank of switches before you, numbered from 1 to n
  - On the first pass, you toggle every switch
  - On the second pass, you toggle swithces 2, 4, 6, ...
  - On the third pass, you toggle switches 3, 6, 9, ...
  - Repeat the above process in a similar fashion for n times
  - Write a method that takes one argument, the total number of switches and returns an Array that identifies which lights are on after n repetitions
- Input: Integer (the total number of switches)
- Output: Array (an Array that identifies which lights are on at the end)

Examples
toggle_light(5) == [1, 4]
toggle_light(10) == [1, 4, 9]

Data Structure
- Input: Integer
- Intermediate: Array
- Output: Array

Algorithm
- Helper method: `toggle(light)`
  - If the light is off (0), turn it on (1)
  - Else turn it off (0)

- Subprocess: To get the indics of the element in the Array (and then plues 1) where the element equals 1
- Helper method: `which_lights_on(lights)`
  - Initalize an empty array for output
  - Iterate through the bank of lights:
    - If the light is on,
      - get its index and plus 1
      - push that number to the output array
  - Return the array

- Main method: `toggle_lights(n)`
  - Create an array of 0's of size n (0 means off and 1 means off)
  - Set `counter` = 1
  - While `counter` <= n:
    - Suppose the current number of iteration is `i`, toggle lights at positions where their indices in the array plus 1 areis divisible by i
    - Increment `counter` by 1
  - Get the indices of the element in the Array (and then plus 1) where the element equals 1 (meaning light's on)
  - Return the Array

=end

def toggle(light)
  light == 0 ? 1 : 0
end

def which_lights_on(lights)
  lights_on = []
  lights.each_with_index do |light, index|
    light_position = index + 1
    lights_on << light_position if light == 1
  end
  lights_on
end

def toggle_lights(n)
  lights = [0] * n
  1.upto(n) do |iteration|
    lights.each_with_index do |light, index|
      light_position = index + 1
      lights[index] = toggle(light) if light_position % iteration == 0
    end
  end
  which_lights_on(lights)
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]

# Further Exploration

=begin

1.
For a light at the position n, it's on after all toggling if it's toggled odd
number of times. At the i-th round of toggling, the light at the position n is
toggled if i is a factor of n. That means, if n has odd number of factors, the
light at position n is on after all toggling. And square numbers are those
numbers which have odd number of factors.

2.
We have to consider the position index of the lights very carefully, because
array index is counted from 0, while light position is counted from 1.

=end

# 3.

def connect(arr, connector = 'and')
  if arr.size == 1
    arr.first.to_s
  elsif arr.size == 2
    arr.join(" #{connector} ")
  else
    arr[0...-1].join(', ') + ", #{connector} #{arr[-1]}"
  end
end

def is_or_are(arr)
  arr.size == 1 ? "is" : "are"
end

def which_lights_on_desc(n)
  lights_on = toggle_lights(n)
  lights_off = (1..n).select { |light| !lights_on.include?(light) }

  lights_on_verb = is_or_are(lights_on)
  lights_off_verb = is_or_are(lights_off)

  "#{lights_off.size > 1 ? "Lights" : "Light"} #{connect(lights_off)} #{lights_on_verb} now off; #{connect(lights_on)} #{lights_off_verb} on"
end

p which_lights_on_desc(5)
p which_lights_on_desc(10)
