print 'Enter day: '
day = gets.chomp.to_i

print 'Enter month: '
month = gets.chomp.to_i

print 'Enter year: ' 
year = gets.chomp.to_i

dim = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

if day > dim[month] 
  puts "Error"
  exit
end

dim[2] = 29 if year % 400 == 0 || year % 4 == 0 && year % 100 != 0

day_number = 0
dim.each do |month_number, month_day|
  day_number += day if month_number == month
  day_number += month_day if month_number < month
end

puts day_number
