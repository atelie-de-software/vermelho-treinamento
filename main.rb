require './src/jogo.rb'
require 'dispel'
require 'ruby2d'

# Set the window size
set width: 250, height: 250
set background: 'black'

jogo    = Jogo.new
posicao = 'right'

puts 'Deseja iniciar o modo grafico? s/n'
resposta = gets[0]

if resposta == 's'
  on :key_down do |event|
    posicao = event.key

    case posicao
      when 'left'
        jogo.esquerda
      when 'right'
        jogo.direita
      when 'up'
        jogo.sobe
      when 'down'
        jogo.desce
    end
  end

  update do
    clear
    jogo.tick

    jogo.tela.split("\n")[0].each_char.with_index { |c, index|
      Image.new('images/food.png',              x: index * 50, y: 0) if c == '*'
      Image.new("images/pacman_#{posicao}.png", x: index * 50, y: 0) if c == 'c'
    }

    jogo.tela.split("\n")[1].each_char.with_index { |c, index|
      Image.new('images/food.png',              x: index * 50, y: 50) if c == '*'
      Image.new("images/pacman_#{posicao}.png", x: index * 50, y: 50) if c == 'c'
    }

    jogo.tela.split("\n")[2].each_char.with_index { |c, index|
      Image.new('images/food.png',              x: index * 50, y: 100) if c == '*'
      Image.new("images/pacman_#{posicao}.png", x: index * 50, y: 100) if c == 'c'
    }

    jogo.tela.split("\n")[3].each_char.with_index { |c, index|
      Image.new('images/food.png',              x: index * 50, y: 150) if c == '*'
      Image.new("images/pacman_#{posicao}.png", x: index * 50, y: 150) if c == 'c'
    }

    jogo.tela.split("\n")[4].each_char.with_index { |c, index|
      Image.new('images/food.png',              x: index * 50, y: 200) if c == '*'
      Image.new("images/pacman_#{posicao}.png", x: index * 50, y: 200) if c == 'c'
    }
  end

  show

else
  Dispel::Screen.open do |screen|
    Dispel::Keyboard.output timeout: 0.5 do |key|
      jogo.tick
      jogo.esquerda if key == :left
      jogo.direita  if key == :right
      jogo.sobe     if key == :up
      jogo.desce    if key == :down

      screen.draw " PACMAN\n" + jogo.tela

      next          unless key
      next          if     key == :timeout
      exit(true)    if     key == :"Ctrl+c"

    end
  end
end