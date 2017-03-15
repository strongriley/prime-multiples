#!/usr/bin/env ruby
DEFAULT_PRIME_COUNT = 10
FIRST_PRIME = 2 # Have to seed

# TODO(riley): Not the cleanest but don't really want to implement the
# segmented sieve and assume it'd be stupid to print a 90x90 prime multiple
# grid
# https://primes.utm.edu/lists/small/1000.txt
MAX_SIEVE_INTEGER = 500
MAX_PRIME_COUNT = 90
MAX_I = Math.sqrt(MAX_SIEVE_INTEGER)

class PrimeMultiples
  class << self
    def find_primes(count)
      # Implements Sieve of Eratosthenes
      # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
      # Complexity O(n log log n) but will be faster with lower prime count
      raise ArgumentError, 'Only doing prime counts up to 90.' if count > 90
      found_primes = []
      integers = [true] * (MAX_SIEVE_INTEGER + 1) # zero
      (FIRST_PRIME..MAX_SIEVE_INTEGER).each  do |i|
        next unless integers[i]
        found_primes << i
        break if found_primes.length == count
        next if i > MAX_I
        mark_multiples(i, integers)
      end
      found_primes
    end

    def multiply_primes(primes)
      # Create a square grid for all the prime multiples and labels
      # TODO(riley): think time complexity is n^1.5 with optimization
      # If we visited each combo it'd be n^2
      multiples = (0..primes.size).collect { [nil] * (primes.size + 1) }
      primes.each_with_index do |first_prime, i|
        multiples[0][i + 1] = first_prime # column labels
        multiples[i + 1][0] = first_prime # row labels
        (i..primes.size - 1).each do |j|
          together = first_prime * primes[j]
          multiples[i + 1][j + 1] = multiples[j + 1][i + 1] = together
        end
      end
      multiples
    end

    def main(count = DEFAULT_PRIME_COUNT)
      primes = find_primes(count)
      multiples = multiply_primes(primes)
      print_multiples(multiples)
    end

    def print_multiples(multiples)
      # Get max digits for spacing in grid
      digit_size = (multiples[multiples.size - 1][multiples.size - 1]).to_s.size
      multiples.each do |row|
        row_text = ''
        row.each do |num|
          num_size = num.to_s.size
          extra_spaces = ' ' * (digit_size - num_size)
          row_text <<  "| #{num}#{extra_spaces} "
        end
        row_text << '|'
        puts row_text
        puts '-' * row_text.size
      end
    end

    private

    def mark_multiples(i, integers)
      Range.new(i, MAX_SIEVE_INTEGER + 1).step(i).each do |excluded|
        integers[excluded] = false
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  begin
    count = Integer(ARGV[0], 10)
  rescue ArgumentError, TypeError
    count = DEFAULT_PRIME_COUNT
  end
  PrimeMultiples.main(count)
end
