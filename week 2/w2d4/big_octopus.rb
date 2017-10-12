fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

####################
# SLUGGISH OCTOPUS #
####################

def bubble_sort!(array)
  arr = array.dup
  arr.map! { |el| el.length }

  len = arr.length - 1
  sorted = false

  until sorted
    sorted = true
    (0...len).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        sorted = false
      end
    end
  end

  biggest_num = arr.last
  array.select { |el| el.length == biggest_num}

end

####################
# DOMINANT OCTOPUS #
####################

def merge_sort(arr, &prc)
  return arr if arr.length <=1

  mid = arr.length/2

  left = merge_sort(arr.take(mid), &prc)
  right = merge_sort(arr.drop(mid), &prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  merged = []
  prc ||= proc { |x, y| x <=> y }

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when 1
      merged << left.shift
    when 0
      merged << left.shift
    when -1
      merged << right.shift
    end
  end

  merged.concat(left).concat(right)#.last
end

##################
# CLEVER OCTOPUS #
##################

def reduce_it(arr)
  arr.reduce do |acc, el|
    acc = el if el.length > acc.length
    acc
  end
end

puts "Bubble Sort: #{bubble_sort!(fishies)}"
puts "Merge Sort: #{merge_sort(fishies)}"
puts "Reduce It: #{reduce_it(fishies)}"

# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

# constant octopus dance
#use a hash for constant lookup
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
