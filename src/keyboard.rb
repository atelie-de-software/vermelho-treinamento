require 'io/console'

class Keyboard
  def read_input
    key = get_input
    return unless key
    return 'UP' if key == 'A'
    return 'DOWN' if key == 'B'
    return 'RIGHT' if key == 'C'
    return 'LEFT' if key == 'D'
    return 'A' if key == 'a'
  end

private
  def get_input
    begin
      STDIN.echo = false
      system 'stty -icanon'
      key = STDIN.gets(1)
      STDIN.echo = true
      key.chr
    ensure
      STDIN.echo = true
    end
  end
end
