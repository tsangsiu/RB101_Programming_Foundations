=begin

# Problem
- Given a year,
  - Return the number of black Fridays in that year

# Examples
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Algorithm
- Initialize `count` to 0 to count the number of black Fridays in a given year
- Iterate from 1 to 12,
  - Create a Date object by Date.new(year, month, 13)
  - If the date is a Friday,
    - Increment `count` by 1
- Return `count`

=end

# Code
require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    date = Date.new(year, month, 13)
	count += 1 if date.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

=begin

# Further Exploration

# Problem
- Count the number of months that have five Fridays

# Examples
p n_five_friday(2016) == 5
p n_five_friday(2020) == 4
p n_five_friday(2022) == 4

# Brainstorm
- Find out the day of the first Friday of a given month
  - While not exceeding the number of day of that month,
    - See how many times a 7 can be added
    - That number +1 would be the number of Friday
- For a given years, iterate though every month
  - If the number of Friday for that month == 5, count it

# Algorithm
- `day_first_friday`
  - Iterate from `1` to `7`,
    - Create a new Date object: Date.new(year, month, day)
    - If the date is a Friday,
      - Return `day`

- `n_friday`
  - Get the number of days of that month
    - Create a Hash for that information
    - If year is a leap year and month is Feb,
      - Increment the number of days by 1
  - Initialize `day` to the day of the first Friday
  - Initialize `n_friday` to `0`
  - While `day` <= the number of days of that month,
    - Increment `n_friday` by 1
    - Increment `day` by 7
  - Return `n_friday`

- `n_five_friday`
  - Initialize `n_five_friday` to `0`
  - Iterate from month 1 to 12,
    - If `n_friday` returns 5,
      - Increment `n_five_friday` by 1
  - Return `n_five_friday`

=end

# Code
def day_first_friday(year, month)
  1.upto(7) do |day|
    date = Date.new(year, month, day)
    return day if date.friday?
  end
end

N_DAYS = {
  1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30,
  7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31
}

def n_friday(year, month)
  n_days = N_DAYS[month]
  n_days += 1 if Date.new(year, 1, 1).leap? && month == 2
  
  n_friday = 0
  day = day_first_friday(year, month)
  while day <= n_days
    n_friday += 1
    day += 7
  end
  
  n_friday
end

def n_five_friday(year)
  n_five_friday = 0
  1.upto(12) do |month|
    n_five_friday += 1 if n_friday(year, month) == 5
  end
  n_five_friday
end

p n_five_friday(2016) == 5
p n_five_friday(2020) == 4
p n_five_friday(2022) == 4
