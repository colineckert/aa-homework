class Map

  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    pair_idx = nil

    @map.each_with_index do |pair, idx|
      pair_idx = idx if pair[0] == key 
    end

    if pair_idx.nil?
      @map.push([key, value])
    else
      @map[pair_idx][1] = value
    end
  end

  def get(key)
    @map.each { |pair| return pair.last if pair.first == key }
  end

  def delete(key)
    @map.reject! { |pair| pair.first == key }
  end

  # def show

  # end

end