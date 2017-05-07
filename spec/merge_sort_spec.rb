require 'spec_helper'

RSpec.describe MergeSort do
  include MergeSort

  describe 'given array of numbers it' do
    it 'sorts small amount from lowest to highest' do
      expect(merge_sort([6, 3, 9])).to eq([3, 6, 9])
    end

    it 'sorts large amount from lowest to highest' do
      expect(merge_sort([6, 100, 22, 10, 3, 12, 21, 25, 31, 1])).to eq(
        [1, 3, 6, 10, 12, 21, 22, 25, 31, 100]
      )
    end
  end
end
