letters = ['A', 'E', 'I', 'U', 'Y']
hash = {}

letters.each do |letter|
  hash[letter] = letter.ord - 64
end

puts hash
