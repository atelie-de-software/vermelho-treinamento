require './src/game.rb'
require 'dispel'
require 'ruby2d'

# Set the window size
set width: 250, height: 250
set background: 'black'

def graphic_mode(game, position)
  on :key_down do |event|
    position = event.key

    case position
    when 'left'
      game.left
    when 'right'
      game.right
    when 'up'
      game.up
    when 'down'
      game.down
    end
  end

  update do
    clear
    game.tick

    game.screen.split("\n").each_with_index do |line, y|
      line.each_char.with_index do |c, x|
        Image.new('images/food.png',               x: x * 50, y: y * 50) if c == '*'
        Image.new("images/pacman_#{position}.png", x: x * 50, y: y * 50) if c == 'c'
      end
    end
  end

  show
end

def terminal_mode(game, position)
  Dispel::Screen.open do |screen|
    Dispel::Keyboard.output timeout: 0.5 do |key|
      game.tick
      game.left  if key == :left
      game.right if key == :right
      game.up    if key == :up
      game.down  if key == :down

      screen.draw " RSPECMAN\n" + game.screen

      next          unless key
      next          if     key == :timeout
      exit(true)    if     key == :"Ctrl+c"
    end
  end
end

# main
game     = Game.new
position = 'right'

puts 'Deseja iniciar o modo grafico? s/n'
answer = gets[0]

if answer == 's'
  graphic_mode(game, position)
else
  terminal_mode(game, position)
end
