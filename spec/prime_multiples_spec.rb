require_relative '../prime_multiples'

describe PrimeMultiples do
  describe '.find_primes' do
    it 'returns just 2 given count=1' do
      expect(PrimeMultiples.find_primes(1)).to eql([2])
    end

    it 'returns first ten primes given count=10' do
      first_ten = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      expect(PrimeMultiples.find_primes(10)).to eql(first_ten)
    end

    it 'returns first 20 primes given count=20' do
      first_twenty = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,
                      53, 59, 61, 67, 71]
      expect(PrimeMultiples.find_primes(20)).to eql(first_twenty)
    end
  end

  describe '.multiply_primes' do
    it 'returns 2x2 grid given just 2' do
      grid = [
        [nil, 2],
        [2,   4]
      ]
      expect(PrimeMultiples.multiply_primes([2])).to eql(grid)
    end

    it 'returns 3x3 grid given just primes 2, 3' do
      grid = [
        [nil, 2, 3],
        [2,   4, 6],
        [3,   6, 9]
      ]
      expect(PrimeMultiples.multiply_primes([2, 3])).to eql(grid)
    end
  end

  describe '.build_table' do
    it 'returns 3x3 with proper spacing given primes 2, 3' do
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
      expect(PrimeMultiples.build_table(grid)).to eql(out_str)
    end
    # TODO(riley): test stdout?
  end
end
