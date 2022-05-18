print 'Enter 1 side: '
a = gets.to_f
print 'Enter 2 side: '
b = gets.to_f
print 'Enter 3 side: '
c = gets.to_f

if a <= 0 || b <= 0 || c <= 0
  puts 'Error. Enter valid values.'
  exit
end

###

if a > b && a > c
  max = a
elsif b > a && b > c
  max = b
elsif c > a && c > b
  max = c
end

###

if (a == b || b == c || c == a) && (a != b || b != c || c != a)
  puts "Isosceles triangle."
elsif a == b && b == c && c == a
  puts 'Equilateral triangle.'
elsif max**2 == a**2 + b**2 || max**2 == b**2 + c**2 || max**2 == c**2 + a**2
  puts 'Right triangle.'
else
  puts 'Thank You Mario! But Our Princess is in Another Castle!'
end
