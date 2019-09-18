require './classes/teste'

RSpec.describe Teste do
  describe "metodo #verdade" do
    it "retorna verdadeiro" do
      teste = Teste.new
      expect(teste.verdade).to be_truthy
    end
  end
end
