class LRUCache
    attr_reader :max_size

    def initialize(size)
        @underlying_array = []
        @max_size = size
    end

    def count
        # returns number of elements currently in cache
        @underlying_array.count
    end

    def add(el)
        # adds element to cache according to LRU principle
        if @underlying_array.include?(el)
            move_to_back(el)
        else 
            remove if self.count == self.max_size
            @underlying_array.push(el)
        end
    end

    def show
        # shows the items in the cache, with the LRU item first
        @underlying_array.dup
    end

    private
    attr_reader :underlying_array

    def remove
        @underlying_array.shift
    end

    def move_to_back(el)
        idx = @underlying_array.index(el)
        @underlying_array.insert(-1, @underlying_array.delete_at(idx))
    end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]