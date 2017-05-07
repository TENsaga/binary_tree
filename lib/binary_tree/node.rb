class Node
  @count = 0
  @instances = []

  class << self
    attr_accessor :count, :instances, :reset
  end

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
end
