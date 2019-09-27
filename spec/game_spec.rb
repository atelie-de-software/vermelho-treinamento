require './src/game'

describe 'RSpecMan' do
  let!(:game) { Game.new }

  context 'Ao iniciar um game' do
    context 'e não pressionar nenhuma tecla' do
      it 'deve ter o RSpecMan no centro' do
        expected = "*    \n" \
                   " # # \n" \
                   " #c  \n" \
                   " # # \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end

      it 'deve ter bolinhas nas extremidades' do
        expected = "*    \n" \
                   " # # \n" \
                   " #c  \n" \
                   " # # \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end

      it 'deve ter uma parede' do
        expected = "*    \n" \
                   " # # \n" \
                   " #c  \n" \
                   " # # \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para a direita' do
      context 'se não houver parede' do
        it 'o RSpecMan deve andar para direita' do
          game.right

          expected = "*    \n" \
                     " # # \n" \
                     " # c \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'se houver parede' do
        it 'deve permanecer no lugar' do
          2.times { game.down }
          2.times { game.left }
          game.up
          game.right
          expected = "*    \n" \
                     " # # \n" \
                     " #   \n" \
                     "c# # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e pressionar para a esquerda' do
      context 'se não houver parede' do
        it 'o RSpecMan deve andar para esquerda' do
          game.right
          game.left

          expected = "*    \n" \
                     " # # \n" \
                     " #c  \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'se houver parede' do
        it 'deve permanecer no lugar' do
          game.up
          game.left
          expected = "*    \n" \
                     " #c# \n" \
                     " #   \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e pressionar para cima' do
      context 'se não houver parede' do
        it 'o RSpecMan deve andar para cima' do
          game.up

          expected = "*    \n" \
                     " #c# \n" \
                     " #   \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'se houver parede' do
        it 'deve permanecer no lugar' do
          game.up
          game.left
          expected = "*    \n" \
                     " #c# \n" \
                     " #   \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e pressionar para baixo' do
      context 'se não houver parede' do
        it 'o RSpecMan deve andar para baixo' do
          game.down

          expected = "*    \n" \
                     " # # \n" \
                     " #   \n" \
                     " #c# \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'se houver parede' do
        it 'deve permanecer no lugar' do
          game.up
          game.up
          game.left
          game.down
          expected = "*c   \n" \
                     " # # \n" \
                     " #   \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e chegar na extremidade' do
      context 'a right' do
        it 'o RSpecMan deve permanecer parado' do
          3.times { game.right }

          expected = "*    \n" \
                     " # # \n" \
                     " #  c\n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'a left' do
        it 'o RSpecMan deve permanecer parado' do
          2.times { game.down }
          3.times { game.left }

          expected = "*    \n" \
                     " # # \n" \
                     " #   \n" \
                     " # # \n" \
                     "c   *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'superior' do
        it 'o RSpecMan deve permanecer parado' do
          game.up
          game.up
          game.up

          expected = "* c  \n" \
                     " # # \n" \
                     " #   \n" \
                     " # # \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'inferior' do
        it 'o RSpecMan deve permanecer parado' do
          game.down
          game.down
          game.down

          expected = "*    \n" \
                     " # # \n" \
                     " #   \n" \
                     " # # \n" \
                     "  c *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e o RSpecMan passar por uma bolinha' do
      it 'ela deve sumir' do
        game.down
        game.down
        game.right
        game.right
        game.up

        expected = "*    \n" \
                   " # # \n" \
                   " #   \n" \
                   " # #c\n" \
                   "     \n"

        expect(game.screen).to eq(expected)
      end

      context 'quando for a última bolinha' do
        context 'e estiver em cima' do
          it 'apresentar o fim de jogo de vitória' do
            2.times { game.down }
            2.times { game.right }
            4.times { game.left }
            4.times { game.up }

            expect(game.screen).to eq('Vitória!')
          end
        end

        context 'e estiver em baixo' do
          it 'apresentar o fim de jogo de vitória' do
            2.times { game.up }
            2.times { game.left }
            4.times { game.right }
            4.times { game.down }

            expect(game.screen).to eq('Vitória!')
          end
        end
      end
    end

    context 'deve aparecer um fantasma' do
      it 'após 5 ticks' do
        game.tick
        game.tick
        game.tick
        game.tick
        game.tick

        expected = "*   f\n" \
                   " # # \n" \
                   " #c  \n" \
                   " # # \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end

      context 'quando pacman encostar nele' do
        it 'apresentar o fim de jogo de derrota' do
          5.times { game.tick }
          2.times { game.up }
          2.times { game.right }

          expect(game.screen).to eq('Game Over!')
        end
      end
    end
  end
end
