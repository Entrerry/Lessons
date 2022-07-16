arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

puts '=================='

arr.each do |x|
  puts x += 1
end

puts '=================='

arr.each { |x| puts x += 1 }

puts '=================='

aa = Proc.new { |x| х }
arr.each { |arr| aa.call(arr) }

puts '=================='
