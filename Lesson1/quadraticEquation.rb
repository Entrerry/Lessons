# ах^2 + bx + c = 0

print 'Enter a: '
a = gets.to_f
print 'Enter b: '
b = gets.to_f
print 'Enter c: '
c = gets.to_f

# (a * (x ** 2)) + (b * x) + c = 0

d = b ** 2 - 4 * a * c
puts "Discriminant = #{d}"

if
    d < 0
    puts 'There is no square root.'
else
    x1 = (-b + Math.sqrt(d)) / (2 * a)
    x2 = (-b - Math.sqrt(d)) / (2 * a)
end

if 
    d == 0
    puts "x1 = x2, and it is #{x1.to_f}" 
elsif
    puts "x1 = #{x1.to_f}, x2 = #{x2.to_f}"
end