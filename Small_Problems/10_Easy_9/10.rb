# def buy_fruit(grocery_list)
#   output = grocery_list.map do |grocery|
#     item, quantity = grocery[0], grocery[1]
#     [item] * quantity
#   end
#   output.flatten
# end

def buy_fruit(grocery_list)
  output = grocery_list.map do |item, quantity|
    [item] * quantity
  end
  output.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
