# prime-multiples

## Usage
The script can be run directly and requires no Gems.
```
./prime_multiple.rb [N number of primes]
```

## Testing
To run tests, run Bundler, then usual rspec:
```
bundle
bundle exec rspec
```

## Details
- TODO(riley): To use N beyond 90, the code would need to be changed either to
  do the sieve for higher numbers or run a segmented sieve.

## Complexity
While the Sieve itself has a time complexity of `n*log(log(n))` where `n` is
`MAX_SIEVE_INTEGER`, because we break once we have enough prime numbers, the
actual time complexity is trickier and would relate to the prime number
function (I think...).

The multiplication time complexity is `n*sqrt(n)` where `n` is the number of
primes. A naive implementation would visit each and every cell but often we can
fill 2 cells for each multiplication.

Ultimately `n*sqrt(n)` dominates so that's the time complexity.
