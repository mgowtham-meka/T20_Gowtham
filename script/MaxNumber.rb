def max_number(num1,num2,num3,num4)
    max_value = num1 > num2 ? (num1 > num3 ? (num1 > num4 ? num1 : num4) : (num3 > num4 ? num3 : num4)) : (num2 > num3 ? (num2 > num4 ? num2 : num4) : (num3 > num4 ? num3 : num4))
end
puts max_number(1,2,3,4)