#!/usr/bin/env ruby
require_relative './base_multiples'


# Calculates square numbers and prints a multiplication table between them.
# Use main() method
class SquareMultiples < BaseMultiples
  class << self
    def find_numbers(count)
      (1..count).map { |i| i*i }
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  begin
    count = Integer(ARGV[0], 10)
  rescue ArgumentError, TypeError
    count = DEFAULT_COUNT
  end
  SquareMultiples.main(count)
end
