
fact = ->(n) {
  (1..n).inject(1) { |ans, i| ans * i }
}
puts fact.call(5)