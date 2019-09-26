require './src/jogo'

describe 'RSpecMan' do
  let!(:jogo) { Jogo.new }

  context 'Ao iniciar um jogo' do
    context 'e não pressionar nenhuma tecla' do
      it 'deve ter o RSpecMan no centro' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end

      it 'deve ter bolinhas nas extremidades' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'e pressionar para a direita' do
      it 'o RSpecMan deve andar para direita' do
        jogo.direita

        expected = "*    \n" \
                   "     \n" \
                   "   c \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'e pressionar para a esquerda' do
      it 'o RSpecMan deve andar para esquerda' do
        jogo.esquerda

        expected = "*    \n" \
                   "     \n" \
                   " c   \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'e pressionar para cima' do
      it 'o RSpecMan deve andar para cima' do
        jogo.sobe

        expected = "*    \n" \
                   "  c  \n" \
                   "     \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'e pressionar para baixo' do
      it 'o RSpecMan deve andar para baixo' do
        jogo.desce

        expected = "*    \n" \
                   "     \n" \
                   "     \n" \
                   "  c  \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'e chegar na extremidade' do
      context 'a direita' do
        it 'o RSpecMan deve permanecer parado' do
          jogo.direita
          jogo.direita
          jogo.direita

          expected = "*    \n" \
          "     \n" \
          "    c\n" \
          "     \n" \
          "    *\n"

          expect(jogo.tela).to eq(expected)
        end
      end

      context 'a esquerda' do
        it 'o RSpecMan deve permanecer parado' do
          jogo.esquerda
          jogo.esquerda
          jogo.esquerda

          expected = "*    \n" \
                     "     \n" \
                     "c    \n" \
                     "     \n" \
                     "    *\n"

          expect(jogo.tela).to eq(expected)
        end
      end

      context 'superior' do
        it 'o RSpecMan deve permanecer parado' do
          jogo.sobe
          jogo.sobe
          jogo.sobe

          expected = "* c  \n" \
                     "     \n" \
                     "     \n" \
                     "     \n" \
                     "    *\n"

          expect(jogo.tela).to eq(expected)
        end
      end

      context 'inferior' do
        it 'o RSpecMan deve permanecer parado' do
          jogo.desce
          jogo.desce
          jogo.desce

          expected = "*    \n" \
                     "     \n" \
                     "     \n" \
                     "     \n" \
                     "  c *\n"

          expect(jogo.tela).to eq(expected)
        end
      end
    end

    context 'e o RSpecMan passar por uma bolinha' do
      it 'ela deve sumir' do
        jogo.desce
        jogo.desce
        jogo.direita
        jogo.direita
        jogo.sobe

        expected = "*    \n" \
                   "     \n" \
                   "     \n" \
                   "    c\n" \
                   "     \n"

        expect(jogo.tela).to eq(expected)
      end
    end

    context 'após 5 ticks' do
      it 'deve aparecer um fantasma' do
        jogo.tick
        jogo.tick
        jogo.tick
        jogo.tick
        jogo.tick

        expected = "*   f\n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(jogo.tela).to eq(expected)
      end
    end
  end
end



#
#   context "Após 5 ticks" do
#     let!(:jogo) { Jogo.new }
#
#
#     xit 'Quando o fantasma anda' do
#       jogo.tick
#
#       xit 'ele deve perseguir o pac man' do
#         expected = "*  f \n"+
#                    "     \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(jogo.tela).to eq expected
#
#         jogo.tick
#
#         expected = "* f  \n"+
#                    "     \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(jogo.tela).to eq expected
#
#         jogo.tick
#
#         expected = "*    \n"+
#                    "  f  \n"+
#                    "  c  \n"+
#                    "     \n"+
#                    "    *\n"
#
#         expect(jogo.tela).to eq expected
#       end
#     end
#   end
#
#   context "Quando pac man relar no fantasma" do
#     xit "Dar game over no jogo" do
#       jogo.sobe
#       jogo.sobe
#       jogo.direita
#
#       expected = "     \n"+
#                  " game\n"+
#                  " over\n"+
#                  "     \n"+
#                  "     \n"
#
#       expect(jogo.tela).to eq expected
#     end
#   end
#
#   xit 'Após 10 ticks deve aparecer a frutinha' do
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#     jogo.tick
#
#     expected = "*   f\n"+
#                "     \n"+
#                "  c  \n"+
#                "     \n"+
#                "6   *\n"
#
#     expect(jogo.tela).to eq expected
#   end
#
#   context "Quando pac man passar na frutinha" do
#     xit "Deve sumir com a frutinha e ficar grande" do
#       jogo.desce
#       jogo.desce
#       jogo.esquerda
#       jogo.esquerda
#       jogo.sobe
#
#       expected = "*   f\n"+
#                  "     \n"+
#                  "     \n"+
#                  "C    \n"+
#                  "    *\n"
#       expect(jogo.tela).to eq expected
#     end
#   end
# end
