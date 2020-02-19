require_relative '../enum'

RSpec.describe Enumerable do
  let(:marray) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

  # my_each
  describe '#my_each' do
    it 'Pushes each element of an array into another in the exact same order' do
      compare = []
      marray.my_each do |i|
        compare << i
      end
      expect(marray).to eql(compare)
    end

    it 'pushes each element of an array into another in the exact same order and compares their length' do
      compare = []
      marray.my_each do |i|
        compare << i
      end
      expect(marray.length).to eql(compare.length)
    end
  end

  # my_each_with_index
  describe '#my_each_with_index' do
    it 'pushes each index of an array into a new array' do
      indexes = []
      marray.my_each_with_index do |_value, index|
        indexes << index
      end
      expect(indexes).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'sums an element plus its index and pushes the result into an array ' do
      sums = []
      marray.my_each_with_index do |value, index|
        sums << value + index
      end
      expect(sums).to eql([1, 3, 5, 7, 9, 11, 13, 15, 17, 19])
    end
  end

  # my_select
  describe '#my_select' do
    it 'creates an array with the odd elements of another' do
      odds = marray.my_select do |num|
        num.odd? && num <= 10
      end
      expect(odds).to eql([1, 3, 5, 7, 9])
    end

    it 'creates an array with the even elements of another' do
      evens = marray.my_select do |num|
        num.even? && num <= 10
      end
      expect(evens).to eql([2, 4, 6, 8, 10])
    end
  end

  # my_all?
  describe '#my_all?' do
    it 'TACO' do
      expect(a).to eql(2)
    end
  end

  # my_any?
  describe '#my_any?' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # my_none?
  describe '#my_none?' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # my_count
  describe '#my_count' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # my_map
  describe '#my_map' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # my_inject
  describe '#my_inject' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # multiply_els
  describe '#multiply_els' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # pattern?
  describe '#pattern?' do
    it 'does magic' do
      expect().to eql()
    end
  end

  # inj_param
  describe '#inj_param' do
    it 'does magic' do
      expect().to eql()
    end
  end
end