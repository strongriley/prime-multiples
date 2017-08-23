#!/usr/bin/env ruby
require_relative './base_multiples'

DEFAULT_PRIME_COUNT = 10
FIRST_PRIME = 2 # Have to seed

# TODO(riley): Not the cleanest but don't really want to implement the
# segmented sieve and assume it'd be stupid to print a 90x90 prime multiple
# grid
# https://primes.utm.edu/lists/small/1000.txt
MAX_SIEVE_INTEGER = 500
MAX_PRIME_COUNT = 90
MAX_I = Math.sqrt(MAX_SIEVE_INTEGER)

# Finds prime numbers and prints a multiplication table between them.
# Use main() method
class PrimeMultiples < BaseMultiples
  class << self
    def find_numbers(count)
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
