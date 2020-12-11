# Part 1 - Big O-ctopus and Biggest Fish

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

# Sluggish Octopus
def sluggish_octopus(arr)
  longest = arr[0]
  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      longest = ele2 if ele2.length > ele1.length
    end
  end
  longest
end

p sluggish_octopus(fish)

# Dominant Octopus
def dominant_octopus(arr)
  merge_sort(arr).first
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2  
  left = merge_sort(arr.take(mid))
  right = merge_sort(arr.drop(mid))

  merge(left, right)
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    case right.first.length <=> left.first.length
    when -1 
      merged << left.shift
    when 0 
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged + left + right
end

p dominant_octopus(fish)

# Clever Octopus
def clever_octopus(arr)
  longest = arr[0]
  arr.each { |fish| longest = fish if fish.length > longest.length }
  longest
end

p clever_octopus(fish)

#Part 2 - Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Slow dance
def slow_dance(dir, array)
  array.each_with_index do |el, i|
    return i if el == dir 
  end
end

p slow_dance("up", tiles_array)
# 0

p slow_dance("right-down", tiles_array)
#> 3

# Constant Dance!
new_tiles_data_structure = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(dir, struct)
  struct[dir]
end

p fast_dance("up", new_tiles_data_structure)
#> 0

p fast_dance("right-down", new_tiles_data_structure)
#> 3