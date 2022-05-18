print 'Enter your name: '
name = gets.strip.capitalize
print 'Enter your height(cm): ' 
height = gets.to_i

idealWeight = (height - 110) * 1.15

if idealWeight > 0
  print "Hey, #{name}, your ideal weight is #{idealWeight.to_i}!\n"   
else
  print "#{name}, your weight is alredy optimal\n"    
end
