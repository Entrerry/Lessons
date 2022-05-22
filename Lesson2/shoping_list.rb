hh = {}

loop do
  print "Enter name of product: "
  name = gets.chomp
    break if name == "stop"

  print "Enter unit price: "
  price = gets.chomp.to_i

  print "Enter amount of products: "
  amount = gets.chomp.to_f

=begin
  hh_x = Hash.new
  hh_x[price] = amount
  hh[name] = hh_x
=end

  hh[name] = { price: price, amount: amount }
end

puts "-----"
puts hh
puts "-----"

result = 0

hh.each do |name, pram|
  sum = pram[:price] * pram[:amount]
  result += sum

  puts "Paid for #{name.capitalize} in total #{sum} "
end

puts "====="
puts "Total paid: #{result}"
