require 'io/console'

loop do
  system 'stty -icanon -echoke'
  STDIN.echo = false

  key = STDIN.getc if key = select([STDIN], [], [], 0.2) && STDIN.getc == "\e" && STDIN.getc == '['

  next puts 'UP' if key == 'A'
  next puts 'DOWN' if key == 'B'
  next puts 'RIGHT' if key == 'C'
  next puts 'LEFT' if key == 'D'
end
