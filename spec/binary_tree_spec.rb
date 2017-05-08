require 'spec_helper'

RSpec.describe Tree do
  describe 'Initializing 7 node tree' do
    before(:all) do
      @tree = Tree.new([9, 2, 8, 1, 0, 5, 4].shuffle)
    end

    it 'Adds items to depth_first in tree traversal order' do
      expect(@tree.depth_first).to eq([4, 1, 0, 2, 8, 5, 9])
    end

    describe '#half' do
      it 'rounds down with odd number' do
        expect(@tree.half([1, 2, 3, 4, 6])).to eq(2)
      end

      it 'returns divided by two with even number' do
        expect(@tree.half([1, 2, 3, 4, 6, 7])).to eq(3)
      end
    end

    describe '#bfs' do
      it 'returns Node on value match' do
        expect(@tree.bfs(1)).to be_instance_of(Node)
      end

      it 'returns nil on value not found' do
        expect(@tree.bfs(55)).to be_nil
      end

      it 'traverses Nodes in bfs order, exits on match' do
        expect { @tree.bfs(1) }.to output("Node: 4\nNode: 1\n").to_stdout
      end
    end

    describe '#dfs' do
      it 'returns Node on value match' do
        expect(@tree.dfs(1)).to be_instance_of(Node)
      end

      it 'returns nil on value not found' do
        expect(@tree.dfs(55)).to be_nil
      end

      it 'traverses Nodes in dfs order, exits on match' do
        expect { @tree.dfs(0) }.to output("Node: 4\nNode: 1\nNode: 0\n").to_stdout
      end
    end
  end
end
