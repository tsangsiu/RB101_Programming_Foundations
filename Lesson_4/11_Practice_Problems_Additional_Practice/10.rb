munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}                 

munsters.each do |key, value|
  age = value["age"]
  case
  when age >= 65 then value["age_group"] = "senior"
  when age >= 18 then value["age_group"] = "adult"
  else                value["age_group"] = "kid"
  end
end
p munsters
