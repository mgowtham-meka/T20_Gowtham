# frozen_string_literal: true

module ExampleMethods
  def calculate_price(i, h, w, v)
    totalvolume = total_volume(v, i)
    totalweight = total_weight(w, i)
    totalheight = total_height(h, i)
    print_enter_a_amount_ten_times
    calculate_total_value_and_return_in_10_different_strings(totalvolume, totalweight, totalheight)
  end

  def total_volume(v, i)
    v * i
  end

  def total_weight(w, i)
    w * i
  end

  def total_height(h, i, _z = nil)
    h * i
  end

  def print_enter_a_amount_ten_times
    (1..10).to_a.each do |_i|
      puts 'Enter a new value'
    end
  end

  def calculate_total_value_and_return_in_10_different_strings(total, total1, total2)
    tempval = total + total1
    tempval += total2
    tempval += tempval
    (1..10).to_a.each do |_i|
      puts 'Results should be below value'
      puts tempval
      puts 'Finalised'
    end
  end
end

class GeeksforGeeks
  include ExampleMethods
end

obj = GeeksforGeeks.new
obj.calculate_price(10, 10, 10, 10)
