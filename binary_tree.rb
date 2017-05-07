require './merge_sort'
require './basic_view'
require 'pry'

class Tree
  include MergeSort
  include BasicView
  attr_reader :view

  def initialize(data)
    @view = []
    build_tree(merge_sort(data))
  end

  # Creates binary tree where each point is a node object
  def build_tree(data, parent = nil)
    return if data.size.zero?
    center = half(data)
    value = data[center]
    @view << value

    # Recusion to split halves until zero then execute logic
    build_tree(l_half = data[0...center], value)
    build_tree(r_half = data[center + 1..-1], value)

    # Node creation and set node properties
    l_child = l_half[half(l_half)]
    r_child = r_half[half(r_half)]
    Node.new(value, parent, l_child, r_child)
  end

  def half(data)
    (data.size / 2).round
  end
end

class Node
  @count = 0
  @instances = []

  class << self
    attr_accessor :count, :instances
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
end

# t = Tree.new([2, 6, 8, 9, 12, 15, 32, 41, 43, 44, 48, 51, 52, 55, 60].shuffle)
# t = Tree.new([2, 6, 8, 9, 12, 15, 32].shuffle)
t = Tree.new([9, 2, 8, 1, 0, 5, 4].shuffle)
t.basic_view(t.view)
