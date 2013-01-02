theNumber = rand(10)+1
solved = false
until solved
  puts "Pick a number between 1 and 10"
  guess = gets.to_i
  solved = guess == theNumber
  puts "Too High!" if guess > theNumber
  puts "Too Low!" if guess < theNumber
end
puts "You got it!"

