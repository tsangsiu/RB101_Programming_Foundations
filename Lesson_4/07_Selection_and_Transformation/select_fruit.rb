produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  hash_to_return = {}
  keys = produce.keys
  counter = 0

  loop do
    current_key = keys[counter]
    current_value = produce[current_key]

    if current_value == 'Fruit'
      hash_to_return[current_key] = current_value
    end
    
    counter += 1
    break if counter == keys.size
  end

  hash_to_return
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
