class Node
  @count = 0
  @instances = []

  class << self
    attr_accessor :count, :instances, :reset
  end

  attr_reader :value, :parent, :l_child, :r_child

  def initialize(value, parent, l_child, r_child)
    @value = value
    @parent = parent
    @l_child = l_child
    @r_child = r_child
    self.class.count += 1
    self.class.instances << self
  end

  def self.all
    @instances.each { |x| p x }
    nil
  end

  def self.reset
    @count = 0
    @instances = []
  end

  # Breadth First Search
  # Set root node, then recusrive call with each new set of base nodes
  def self.bfs(value, base_nodes = [])
    base_nodes.push(@instances.select { |x| x.parent.nil? }).flatten!
    node_order(value, base_nodes)
  end

  # Checks target value on each base node as seen, returns node if match
  def self.node_order(value, base_nodes, children = [])
    return if base_nodes.empty?
    base_nodes.each do |x|
      puts "Node: #{x.value}"
      return x if value == x.value
      children.push(x.l_child, x.r_child)
    end
    base_nodes = @instances.select { |x| children.include?(x.value) }
    node_order(value, base_nodes)
  end

  # Depth First Search
  # Utilizes depth_first BinaryTree variable that populates as tree inits
  def self.dfs(value, depth_first)
    depth_first.each do |x|
      puts "Node: #{x}"
      node = @instances.find { |y| y if x == y.value }
      return node if node.value == value
    end
    nil
  end
end
