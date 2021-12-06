input = [4,5,3,2,3,3,2,4,2,1,2,4,5,2,2,2,4,1,1,1,5,1,1,2,5,2,1,1,4,4,5,5,1,2,1,
        1,5,3,5,2,4,3,2,4,5,3,2,1,4,1,3,1,2,4,1,1,4,1,4,2,5,1,4,3,5,2,4,5,4,2,2,
        5,1,1,2,4,1,4,4,1,1,3,1,2,3,2,5,5,1,1,5,2,4,2,2,4,1,1,1,4,2,2,3,1,2,4,5,
        4,5,4,2,3,1,4,1,3,1,2,3,3,2,4,3,3,3,1,4,2,3,4,2,1,5,4,2,4,4,3,2,1,5,3,1,
        4,1,1,5,4,2,4,2,2,4,4,4,1,4,2,4,1,1,3,5,1,5,5,1,3,2,2,3,5,3,1,1,4,4,1,3,
        3,3,5,1,1,2,5,5,5,2,4,1,5,1,2,1,1,1,4,3,1,5,2,3,1,3,1,4,1,3,5,4,5,1,3,4,
        2,1,5,1,3,4,5,5,2,1,2,1,1,1,4,3,1,4,2,3,1,3,5,1,4,5,3,1,3,3,2,2,1,5,5,4,
        3,2,1,5,1,3,1,3,5,1,1,2,1,1,1,5,2,1,1,3,2,1,5,5,5,1,1,5,1,4,1,5,4,2,4,5,
        2,4,3,2,5,4,1,1,2,4,3,2,1]

# Part 1
# day = 0
# def day_cycle(next_input, day)
#   next_input = next_input.inject([]) do |memo, input|
#     if input == 0
#       memo << 6
#       memo << 8
#     else
#       memo << input - 1
#     end
#     memo
#   end
#   p "this was day #{day}"
#   next_input
# end
# next_input = input
# 256.times do
#   day += 1
#   next_input = day_cycle(next_input, day)
#   p "we have #{next_input.count} fishies"
# end

# Part 2
test_input = [3,4,3,1,2]
fishies = {}
input.each do |n|
  fishies[n] = 0 if fishies[n] == nil
  fishies[n] += 1
end

def create_fish(hash, fish_day, count)
  hash[fish_day] = 0 if hash[fish_day] == nil
  hash[fish_day] += count
end

def day_cycle(hash, day, end_day)
  new_hash = {} if new_hash == nil
  hash.clone.each do |key, value|
    if key == 0
      create_fish(new_hash, 6, value)
      create_fish(new_hash, 8, value)
    else
      new_key = key - 1
      create_fish(new_hash, new_key, value)
    end
  end
  day += 1
  p "After day #{day} there are #{new_hash.values.sum} fishies: #{new_hash}"
  day_cycle(new_hash, day, end_day) unless day == end_day
end

day_cycle(fishies, 0, 256)
