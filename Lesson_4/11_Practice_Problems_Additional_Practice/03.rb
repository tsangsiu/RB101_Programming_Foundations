ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p (ages.reject do |pair, age|
  age >= 100
end.to_h)

p (ages.each_with_object({}) do |(name, age), hash|
  if !(age >= 100)
    hash[name] = age
  end
end)
