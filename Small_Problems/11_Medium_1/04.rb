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
    light_on << light_position if light == 1
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

p toggle_lights(5) #== [1, 4]
p toggle_lights(10) #== [1, 4, 9]
