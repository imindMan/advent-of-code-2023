
file = File.open("day8.txt")

instructions = file.readline
# i'm too done with manual parsing so I just implement regex to save my time
patterns = file.read.scan(/([A-Z]+) = \(([A-Z]+), ([A-Z]+)\)/)

places_hash = Hash.new

patterns.each do |pattern|
  places_hash[pattern[0]] = [pattern[1], pattern[2]]

end

place = "AAA"
step = 0

# just scan for every steps
while place != "ZZZ"
  instructions.chop.split("").each do |instruction|
    case instruction
    when "R"
      place = places_hash[place][1]
      step += 1
    when "L"
      place = places_hash[place][0]
      step += 1
    end
  end
end

puts step
