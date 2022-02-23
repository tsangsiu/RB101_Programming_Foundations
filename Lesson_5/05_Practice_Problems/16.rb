CHARS = ('a'..'f').to_a + ('0'..'9').to_a

def generate_uuid
  "#{CHARS.sample(8).join}-" +
  "#{CHARS.sample(4).join}-" +
  "#{CHARS.sample(4).join}-" +
  "#{CHARS.sample(4).join}-" +
  "#{CHARS.sample(12).join}"
end

p generate_uuid
