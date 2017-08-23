require_relative '../square_multiples'

describe SquareMultiples do
  describe '.find_numbers' do
    it 'returns just [1] given count=1' do
      expect(SquareMultiples.find_numbers(1)).to eql([1])
    end

    it 'returns [1, 4] given count=2' do
      expect(SquareMultiples.find_numbers(2)).to eql([1, 4])
    end

    it 'returns [1, 4, 9, 16] given count=4' do
      expect(SquareMultiples.find_numbers(4)).to eql([1, 4, 9, 16])
    end
  end

  describe '.multiply_squares' do
    it 'returns 2x2 grid given just 1' do
      grid = [
        [nil, 1],
        [1,   1]
      ]
      expect(SquareMultiples.multiply_numbers([1])).to eql(grid)
    end

    it 'returns 3x3 grid given just squares 1, 4, 9' do
      grid = [
        [nil, 1, 4, 9],
        [1,   1, 4, 9],
        [4,   4, 16, 36],
        [9,   9, 36, 81]
      ]
      expect(SquareMultiples.multiply_numbers([1, 4, 9])).to eql(grid)
    end
  end

  describe '.build_table' do
    # TODO(riley): move to base class tests
    it 'returns 3x3 with proper spacing given not actually squares 2, 3' do
      out_str = "|   | 2 | 3 |\n"\
                "-------------\n"\
                "| 2 | 4 | 6 |\n"\
                "-------------\n"\
                "| 3 | 6 | 9 |\n"\
                "-------------\n"
      grid = [
        [nil, 2, 3],
        [2,   4, 6],
        [3,   6, 9]
      ]
      expect(SquareMultiples.build_table(grid)).to eql(out_str)
    end
    # TODO(riley): test stdout?
  end
end
