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
  # Utilizes node_order recusion to build order by level
  def self.bfs(value, base_nodes = [])
    base_nodes.push(@instances.select { |x| x.parent.nil? }).flatten!
    node_order(value, base_nodes)
  end

  # Checks target value on each base node as seen, returns node if match
  def self.node_order(value, base_nodes, children = [])
    return if base_nodes.empty?
    base_nodes.each do |node|
      puts "Node: #{node.value}"
      return node if node.value == value
      children.push(node.l_child, node.r_child)
    end
    base_nodes = @instances.select { |n| children.include?(n.value) }

    # New base_nodes moving down the tree
    node_order(value, base_nodes)
  end

  # Depth First Search
  # Utilizes depth_first Tree variable that populates as tree inits
  def self.dfs(value, depth_first)
    depth_first.each do |val|
      puts "Node: #{val}"
      node = @instances.find { |n| n if val == n.value }
      return node if node.value == value
    end
    nil
  end
end
