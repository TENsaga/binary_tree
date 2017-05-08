require_relative './binary_tree/merge_sort'
require_relative './binary_tree/node'

require 'pry'

class Tree
  include MergeSort

  attr_accessor :depth_first

  def initialize(data)
    @depth_first = []
    Node.reset
    build_tree(merge_sort(data))
  end

  # Creates binary tree where each point is a node object
  def build_tree(data, parent = nil)
    return if data.size.zero?
    center = half(data)
    value = data[center]
    @depth_first << value

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

  def bfs(value)
    Node.bfs(value)
  end

  def dfs(value)
    Node.dfs(value, @depth_first)
  end

  def all
    Node.all
  end
end
