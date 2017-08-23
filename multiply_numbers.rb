#!/usr/bin/env ruby
require_relative './prime_multiples'
require_relative './square_multiples'
require 'optparse'

if __FILE__ == $PROGRAM_NAME
  options = {}
  options[:sequence] = "prime"
  options[:number] = 10
  OptionParser.new do |opts|
    opts.banner = "Usage: ./multiply_numbers.rb [options]"

    opts.on("-s", "--sequence SEQUENCE", "Sequence of numbers") do |s|
      options[:sequence] = s
    end
    opts.on("-n", "--number NUMBER", "How many numbers") do |n|
    begin
      n_int = Integer(n, 10)
      options[:number] = n_int
    rescue ArgumentError, TypeError
      puts "Defaulting to 10"
    end
    end
  end.parse!

  sequences = {
    'prime'=> PrimeMultiples,
    'square'=> SquareMultiples
  }
  helper_class = sequences[options[:sequence]]
  if !helper_class
    puts "No implementation for '#{options[:sequence]}', defaulting to prime"
    helper_class = PrimeMultiples
  end
  helper_class.main(options[:number])
end
