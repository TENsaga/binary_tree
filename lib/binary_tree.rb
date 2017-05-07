require './lib/binary_tree/merge_sort'
require './lib/binary_tree/basic_view'
require './lib/binary_tree/node'
require 'pry'

class BinaryTree
  include MergeSort
  include BasicView
  attr_reader :view

  def initialize(data)
    @view = []
    Node.reset
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
