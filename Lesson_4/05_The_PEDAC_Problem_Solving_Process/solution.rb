# Helper Methods

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.size == row_length
  end
  row
end

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]

# Main Program

# row number: 1 —> sum of integers in row: 2
# row number: 2 —> sum of integers in row: 10
# row number: 4 —> sum of integers in row: 68

# Calculating the start integer:
# Rule: First integer of row == last integer of preceding row + 2
# Algorithm:
#   - Get the last row of the rows array
#   - Get the last integer of that row
#   - Add 2 to the integer

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68
