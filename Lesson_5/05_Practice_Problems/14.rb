hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

output = []
hsh.each_value do |hash|
  if hash[:type] == 'fruit'
    output << (hash[:colors].map { |color| color.capitalize })
  elsif hash[:type] == 'vegetable'
    output << hash[:size].upcase
  end
end

p output
