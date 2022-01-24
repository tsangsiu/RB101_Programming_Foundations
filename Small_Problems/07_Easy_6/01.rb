DEGREE = "\xC2\xB0"

def dms(angle)
  angle = angle % 360
  degree = angle.truncate
  minute = ((angle - degree) * 60).truncate
  second = ((((angle - degree) * 60) - minute) * 60).truncate
  

  %(#{degree}#{DEGREE}#{format("%02d", minute)}'#{format("%02d", second)}")
end

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)

# Further Exploration
puts dms(400)
puts dms(-40)
puts dms(-420)
