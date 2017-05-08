# Binary Tree
Author: TENsaga - Aspen Swanson 2017

# Description
Binary Tree creation and traversal, utilizing the merge sort algorithm, and BFS/DFS for searching.

## Visual Represenation
Tree.new([12, 8, 32, 2, 6, 9, 15].shuffle)

                    9
          6                    15
    2           8        12          32

## Installation
Download repo

## Usage
cd binary_tree

- Start IRB
bin/console

- Create Tree: any size, ordered or unordered, with odd or even number of nodes

        tree = Tree.new([2, 6, 8, 9, 12, 15, 32, 41, 43, 44, 48, 51, 52, 55, 60].shuffle)

        tree = Tree.new([5, 1, 2, 4, 12, 42].shuffle)

- View Node instances, values, parents, and children

        tree.all

##### Use Breadth First and Depth First searching to retreive node object at given value. Depending on where the node is in the tree, one search may find it faster by hitting less nodes on the way. The program will print each node hop.

- Breadth-first search (BFS): Starts at the tree root, gathering values based on level before moving onto next level of tree

        tree.bfs(5)

- Depth-first search (DFS): Starts at the root, explores as far as possible along each LEFT branch, before backtracking to complete RIGHT branch.

        tree.dfs(12)