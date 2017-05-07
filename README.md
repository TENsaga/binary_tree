# Binary Tree

Binary Tree creation and traversal

## Installation

Download repo

## Usage

cd binary_tree

- Start IRB
bin/console

- Create Tree: any size, ordered or unordered, with odd or even number of nodes
BinaryTree.new([2, 6, 8, 9, 12, 15, 32, 41, 43, 44, 48, 51, 52, 55, 60].shuffle)
BinaryTree.new([5, 1, 2, 4, 12, 42].shuffle)

- View Node instances, values, parents, and children
Node.all

- Hard coded print available only for testing 3 level trees with < 7 nodes
tree = BinaryTree.new([2, 6, 8, 9, 12, 15, 32].shuffle)
tree.basic_view(tree.view)
