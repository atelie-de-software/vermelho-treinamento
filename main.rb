require './classes/keyboard'

loop do
  command = Keyboard.read_input
  puts command if command
end
