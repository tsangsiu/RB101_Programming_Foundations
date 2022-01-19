HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
WEEKDAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thusday', 'Friday', 'Saturday']

def time_of_day(minutes)
  if minutes < 0
    minutes += MINUTES_PER_DAY until minutes >= 0
  end
  hour, minute = (minutes % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  "#{format("%02d", hour)}:#{format("%02d", minute)}"
end

# Further Exploration
# Problem 1
def time_of_day(minutes)
  hour, minute = (minutes % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  "#{format("%02d", hour)}:#{format("%02d", minute)}"
end

# Problem 2
def time_of_day(minutes)
  time = Time.at(minutes * MINUTES_PER_HOUR, in: "+00:00")
  "#{format("%02d", time.hour)}:#{format("%02d", time.min)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Problem 3
def weekday_and_time_of_day(minutes)
  time = Time.at(minutes * MINUTES_PER_HOUR, in: "+00:00")
  weekday = WEEKDAYS[minutes / MINUTES_PER_DAY]
  "#{weekday} #{format("%02d", time.hour)}:#{format("%02d", time.min)}"
end

p weekday_and_time_of_day(0)
p weekday_and_time_of_day(-3)
p weekday_and_time_of_day(35)
p weekday_and_time_of_day(-1437)
p weekday_and_time_of_day(3000)
p weekday_and_time_of_day(800)
p weekday_and_time_of_day(-4231)
