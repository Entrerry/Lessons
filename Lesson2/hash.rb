letter = ['A', 'E', 'I', 'U', 'Y']
hash = Hash.new

letter.each do |l|
  hash[l] = l.ord - 64
end

puts hash
