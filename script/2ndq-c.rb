# frozen_string_literal: true

fact = lambda { |n|
  (1..n).inject(2) { |ans, i| ans * i }
}
puts fact.call(5)
