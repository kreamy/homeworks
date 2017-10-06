class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
  end

  def remove(key)
    map_dup = @map
    map_dup.each { |pair| @map.delete(pair) if pair.include?(key) }
  end

  def show
    @map.dup
  end
end
#
map = Map.new
p map.assign("a", 1)
p map.assign("b", 2)
p map.assign("c", 3)
p map.lookup("b")
p map.remove("c")
p map.show
