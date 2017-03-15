#!/usr/bin/env ruby
DEFAULT_PRIME_COUNT = 10

def find_primes; end

def multiply_primes(primes); end

def print_prime_multiples(count = DEFAULT_PRIME_COUNT)
  puts "TODO #{count}"
end

if __FILE__ == $PROGRAM_NAME
  begin
    count = Integer(ARGV[0], 10)
  rescue ArgumentError, TypeError
    count = DEFAULT_PRIME_COUNT
  end
  print_prime_multiples(count)
end
