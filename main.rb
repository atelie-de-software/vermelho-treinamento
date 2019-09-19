require './classes/keyboard'

loop do
  command = Keyboard.new.read_input
  puts command if command
end
