#!/usr/bin/env ruby
loop do
  key = STDIN.getc if key = select([STDIN], [], [], 0.2) && STDIN.getc == "\e" && STDIN.getc == '['
  case key
  when "A"
    puts 'UP ARROW'
  when "B"
    puts 'DOWN ARROW'
  when "C"
    puts 'RIGHT ARROW'
  when "D"
    puts 'LEFT ARROW'
  end
end
