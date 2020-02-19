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
    it 'Checks if all the members of an array are strings' do
      warray = %w[taco sandwich pizza cake]
      boolie = warray.my_all? do |word|
        word.is_a? String
      end
      expect(boolie).to eql(true)
    end

    it 'Checks if all the members of an array are integers' do
      boolie = marray.my_all? do |int|
        int.is_a? Integer
      end
      expect(boolie).to eql(true)
    end

    it 'Checks if all the members of an array are single digit' do
      boolie = marray.my_all? do |int|
        int.size < 2
      end
      expect(boolie).to eql(false)
    end
  end

  # my_any?

  describe '#my_any?' do
    it 'checks if any value of the array is a string' do
      boolie = marray.my_any? do |int|
        int.is_a? String
      end
      expect(boolie).to eql(false)
    end

    it 'checks if any value of the array is 5' do
      boolie = marray.my_any? do |int|
        int == 5
      end
      expect(boolie).to eql(true)
    end

    it 'checks if any value of the array has more than one digit' do
      boolie = marray.my_any? do |int|
        int.size > 1
      end
      expect(boolie).to eql(true)
    end
  end

  # my_none?

  describe '#my_none?' do
    it 'checks if no value of the array is a string' do
      boolie = marray.my_none? do |int|
        int.is_a? String
      end
      expect(boolie).to eql(true)
    end

    it 'checks if no value of the array is 666' do
      boolie = marray.my_none? do |int|
        int == 666
      end
      expect(boolie).to eql(true)
    end

    it 'checks if no value of the array has more than one digit' do
      boolie = marray.my_none? do |int|
        int.size > 1
      end
      expect(boolie).to eql(false)
    end
  end

  # my_count

  describe '#my_count' do
    it 'counts how many values of the array are integers' do
      counting = marray.my_count do |int|
        int.is_a? Integer
      end
      expect(counting).to eql(10)
    end

    it 'counts how many values of the array are 5' do
      counting = marray.my_count do |int|
        int == 5
      end
      expect(counting).to eql(1)
    end

    it 'counts how many values of the array have more than a digit integers' do
      counting = marray.my_count do |int|
        int.is_a? String
      end
      expect(counting).to eql(0)
    end
  end

  # my_map

  describe '#my_map' do
    it 'makes every word in the array plural' do
      vocabulary = %w[taco pizza cake]
      plurals = vocabulary.my_map do |word|
        word + 's'
      end
      expect(plurals).to eql(%w[tacos pizzas cakes])
    end

    it 'makes every integer in the array a string' do
      numbers = [1, 2, 3]
      strings = numbers.my_map(&:to_s)
      expect(strings).to eql(%w[1 2 3])
    end

    it 'multiplies every odd number by two' do
      numbers = [1, 2, 3, 4, 5]
      doubles = numbers.my_map do |inte|
        inte *= 2 if inte.odd?
        inte if inte.even?
      end
      expect(doubles).to eql([2, 2, 6, 4, 10])
    end
  end

  # my_inject

  describe '#my_inject' do
    it 'sums the values of the array' do
      injsum = marray.my_inject(:+)
      expect(injsum).to eql(55)
    end

    it 'multiplies the values of the array' do
      injsum = marray.my_inject(:*)
      expect(injsum).to eql(3_628_800)
    end

    it 'finds the longest word' do
      longlong = %w[taco spaghetti pizza].my_inject do |word1, word2|
        word1.length > word2.length ? word1 : word2
      end
      expect(longlong).to eql('spaghetti')
    end
  end

  # multiply_els

  describe '#multiply_els' do
    it 'multiplies all the values of the array' do
      somerray = [1, 1, 1, 1, 1, 1]
      multrray = multiply_els(somerray)
      expect(multrray).to eql(1)
    end

    it 'multiplies all the values of the array' do
      somerray = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
      multrray = multiply_els(somerray)
      expect(multrray).to eql(3_715_891_200)
    end

    it 'multiplies all the values of the array' do
      somerray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
      multrray = multiply_els(somerray)
      expect(multrray).to eql(122_522_400)
    end
  end

  # pattern?
  describe '#pattern?' do
    it 'checks if both elements are integers' do
      boolie = pattern?(1, 1)
      expect(boolie).to eql(true)
    end

    it 'checks if both elements are integers' do
      boolie = pattern?(1, '1')
      expect(boolie).to eql(false)
    end

    it 'checks if both elements are strings' do
      boolie = pattern?('1', '1')
      expect(boolie).to eql(true)
    end

    it 'checks if both elements are arrays' do
      boolie = pattern?([1, 2], 1)
      expect(boolie).to eql(false)
    end

    it 'checks if both elements are arrays' do
      boolie = pattern?([1, 2], [1, 2])
      expect(boolie).to eql(true)
    end
  end

  # inj_param
  describe '#inj_param' do
    it 'does magic' do
      expect().to eql()
    end
  end
end
