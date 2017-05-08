require 'spec_helper'

RSpec.describe Node do
  describe 'Initializing 7 node tree' do
    before(:all) do
      Tree.new([9, 2, 8, 1, 0, 5, 4].shuffle)
    end
    it 'Creates 7 node objects' do
      expect(Node.instances.size).to eq(7)
    end

    it 'Increases Node count to 7' do
      expect(Node.count).to eq(7)
    end

    context 'Sets parents' do
      it 'of top level value to nil' do
        expect(Node.instances[6].instance_variable_get(:@parent)).to eq(nil)
      end

      it 'of second level to be top level value' do
        expect(Node.instances[2].instance_variable_get(:@parent)).to eq(4)
        expect(Node.instances[5].instance_variable_get(:@parent)).to eq(4)
      end

      it 'of third level to be second level values' do
        expect(Node.instances[0].instance_variable_get(:@parent)).to eq(1)
        expect(Node.instances[1].instance_variable_get(:@parent)).to eq(1)
        expect(Node.instances[3].instance_variable_get(:@parent)).to eq(8)
        expect(Node.instances[4].instance_variable_get(:@parent)).to eq(8)
      end
    end

    context 'Sets children' do
      it 'of top level value' do
        expect(Node.instances[6].instance_variable_get(:@l_child)).to eq(1)
        expect(Node.instances[6].instance_variable_get(:@r_child)).to eq(8)
      end

      it 'of second level values' do
        expect(Node.instances[2].instance_variable_get(:@l_child)).to eq(0)
        expect(Node.instances[2].instance_variable_get(:@r_child)).to eq(2)
        expect(Node.instances[5].instance_variable_get(:@l_child)).to eq(5)
        expect(Node.instances[5].instance_variable_get(:@r_child)).to eq(9)
      end

      it 'of third level values to nil' do
        expect(Node.instances[0].instance_variable_get(:@l_child)).to eq(nil)
        expect(Node.instances[0].instance_variable_get(:@r_child)).to eq(nil)
        expect(Node.instances[1].instance_variable_get(:@l_child)).to eq(nil)
        expect(Node.instances[1].instance_variable_get(:@r_child)).to eq(nil)
        expect(Node.instances[3].instance_variable_get(:@l_child)).to eq(nil)
        expect(Node.instances[3].instance_variable_get(:@r_child)).to eq(nil)
        expect(Node.instances[4].instance_variable_get(:@l_child)).to eq(nil)
        expect(Node.instances[4].instance_variable_get(:@r_child)).to eq(nil)
      end
    end
  end
end