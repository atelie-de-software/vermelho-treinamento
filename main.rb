require './src/keyboard'

number = 1

loop do
  system('clear')
  puts Time.now
  p number.round(2)

  command = Keyboard.new.read_input
  number += 1 if command == 'UP'
  number -= 1 if command == 'DOWN'
  number += 0.1 if command == 'RIGHT'
  number -= 0.1 if command == 'LEFT'
end
