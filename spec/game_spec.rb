require './src/game'

describe 'RSpecMan' do
  let!(:game) { Game.new }

  context 'Ao iniciar um game' do
    context 'e não pressionar nenhuma tecla' do
      it 'deve ter o RSpecMan no centro' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end

      it 'deve ter bolinhas nas extremidades' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para a right' do
      it 'o RSpecMan deve andar para right' do
        game.right

        expected = "*    \n" \
                   "     \n" \
                   "   c \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para a left' do
      it 'o RSpecMan deve andar para left' do
        game.left

        expected = "*    \n" \
                   "     \n" \
                   " c   \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para cima' do
      it 'o RSpecMan deve andar para cima' do
        game.up

        expected = "*    \n" \
                   "  c  \n" \
                   "     \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para baixo' do
      it 'o RSpecMan deve andar para baixo' do
        game.down

        expected = "*    \n" \
                   "     \n" \
                   "     \n" \
                   "  c  \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e chegar na extremidade' do
      context 'a right' do
        it 'o RSpecMan deve permanecer parado' do
          game.right
          game.right
          game.right

          expected = "*    \n" \
          "     \n" \
          "    c\n" \
          "     \n" \
          "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'a left' do
        it 'o RSpecMan deve permanecer parado' do
          game.left
          game.left
          game.left

          expected = "*    \n" \
                     "     \n" \
                     "c    \n" \
                     "     \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'superior' do
        it 'o RSpecMan deve permanecer parado' do
          game.up
          game.up
          game.up

          expected = "* c  \n" \
                     "     \n" \
                     "     \n" \
                     "     \n" \
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
                     "     \n" \
                     "     \n" \
                     "     \n" \
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
                   "     \n" \
                   "     \n" \
                   "    c\n" \
                   "     \n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'após 5 ticks' do
      it 'deve aparecer um fantasma' do
        game.tick
        game.tick
        game.tick
        game.tick
        game.tick

        expected = "*   f\n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end
  end
end



#
#   context "Após 5 ticks" do
#     let!(:game) { Jogo.new }
#
#
#     xit 'Quando o fantasma anda' do
#       game.tick
#
#       xit 'ele deve perseguir o pac man' do
#         expected = "*  f \n"+
#                    "     \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(game.screen).to eq expected
#
#         game.tick
#
#         expected = "* f  \n"+
#                    "     \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(game.screen).to eq expected
#
#         game.tick
#
#         expected = "*    \n"+
#                    "  f  \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(game.screen).to eq expected
#       end
#     end
#   end
#
#   context "Quando pac man relar no fantasma" do
#     xit "Dar game over no game" do
#       game.up
#       game.up
#       game.right
#
#       expected = "     \n"+
#                  " game\n"+
#                  " over\n"+
#                  "     \n"+
#                  "     \n"
#
#       expect(game.screen).to eq expected
#     end
#   end
#
#   xit 'Após 10 ticks deve aparecer a frutinha' do
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#     game.tick
#
#     expected = "*   f\n"+
#                "     \n"+
#                "  c  \n"+
#                "     \n"+
#                "6   *\n"
#
#     expect(game.screen).to eq expected
#   end
#
#   context "Quando pac man passar na frutinha" do
#     xit "Deve sumir com a frutinha e ficar grande" do
#       game.down
#       game.down
#       game.left
#       game.left
#       game.up
#
#       expected = "*   f\n"+
#                  "     \n"+
#                  "     \n"+
#                  "C    \n"+
#                  "    *\n"
#       expect(game.screen).to eq expected
#     end
#   end
# end
