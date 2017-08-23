#!/usr/bin/env ruby
DEFAULT_COUNT = 10


# Calculates numbers and prints a multiplication table between them.
# Must be subclassed and method find_numbers overridden
# Use main() method
class BaseMultiples
  class << self
    def find_numbers(count)
      raise NotImplementedError
    end

    def multiply_numbers(numbers)
      # Create a square grid for all the multiples and labels
      # TODO(riley): think time complexity is n^1.5 with optimization
      # If we visited each combo it'd be n^2
      multiples = (0..numbers.size).collect { [nil] * (numbers.size + 1) }
      numbers.each_with_index do |first_number, i|
        multiples[0][i + 1] = first_number # column labels
        multiples[i + 1][0] = first_number # row labels
        (i..numbers.size - 1).each do |j|
          together = first_number * numbers[j]
          multiples[i + 1][j + 1] = multiples[j + 1][i + 1] = together
        end
      end
      multiples
    end

    def main(count = DEFAULT_COUNT)
      numbers = find_numbers(count)
      multiples = multiply_numbers(numbers)
      puts build_table(multiples)
    end

    def build_table(multiples)
      # Get max digits for spacing in grid
      digit_size = (multiples[multiples.size - 1][multiples.size - 1]).to_s.size
      row_strs = multiples.map do |row|
        row_text = ''
        row.each do |num|
          num_size = num.to_s.size
          extra_spaces = ' ' * (digit_size - num_size)
          row_text <<  "| #{num}#{extra_spaces} "
        end
        row_text << '|'
        "#{row_text}\n#{'-' * row_text.size}\n"
      end
      row_strs.join
    end
  end
end
