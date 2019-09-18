require 'io/console'

class Keyboard
  def self.read_input
    key = Keyboard.get_input
    return 'UP' if key == 'A'
    return 'DOWN' if key == 'B'
    return 'RIGHT' if key == 'C'
    return 'LEFT' if key == 'D'
  end

  def self.get_input
    system 'stty -icanon -echoke'
    STDIN.echo = false
    key = STDIN.getc if key = select([STDIN], [], [], 0.2) && STDIN.getc == "\e" && STDIN.getc == '['
    STDIN.echo = true
    key
  end
end
