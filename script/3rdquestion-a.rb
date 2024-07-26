# frozen_string_literal: true

def sort_hash_by_key_length(h)
  h.sort_by { |key, _| key.to_s.length }.to_h
end

h = { 'gowtham' => 1, 'ashok' => 2, 'aaa' => 3, 'ab' => 4 }
sorted_hash = sort_hash_by_key_length(h)
puts sorted_hash
