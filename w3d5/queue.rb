class Queue

  def initialize
    @inner_array = []
  end

  def enqueue(el)
    inner_array.unshift(el)
    self
  end

  def dequeue
    inner_array.pop
  end

  def peek
    inner_array.last
  end

  def show
    inner_array.dup
  end

  private

  attr_reader :inner_array

end