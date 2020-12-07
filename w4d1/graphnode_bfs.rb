require "set"

class GraphNode
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def inspect
    { 'value' => @value, 'neighbors' => @neighbors }.inspect
  end

  def bfs(starting_node, target_value, visited = Set.new())
    arr = [starting_node]

    until arr.empty?
      node = arr.shift
      if !visited.include?(node.value)
        return node if node.value == target_value
        visited.add(node.value)
        arr.push(*node.neighbors)
      end
    end

  end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, "b")
p a.bfs(a, "f")