arr = [0, 1]

while arr[-1] <= 100
  arr << arr[-1] + arr[-2]
end

arr.delete_at(-1)

puts arr
