require 'io/console'

class Keyboard
  def read_input
    key = get_input
    return 'UP' if key == 'A'
    return 'DOWN' if key == 'B'
    return 'RIGHT' if key == 'C'
    return 'LEFT' if key == 'D'

    return 'LETTER A' if key == 'a'
  end

  def get_input
    system 'stty -icanon -echoke'
    STDIN.echo = false
    key = STDIN.gets(1)
    STDIN.echo = true
    key
  end
end
