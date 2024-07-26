# frozen_string_literal: true

def max_number(num1, num2, num3, num4)
  if num1 > num2
    if num1 > num3
      num1 > num4 ? num1 : num4
    else
      (num3 > num4 ? num3 : num4)
    end
  else
    (if num2 > num3
       num2 > num4 ? num2 : num4
     else
       (num3 > num4 ? num3 : num4)
     end)
  end
end
puts max_number(1, 2, 3, 4)
