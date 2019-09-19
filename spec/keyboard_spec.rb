require './src/keyboard'

RSpec.describe Keyboard do
  describe "method #read_input" do
    it "return UP imputing arrow up" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('A')
      expect(Keyboard.new.read_input).to eq('UP')
    end

    it "return DOWN imputing arrow down" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('B')
      expect(Keyboard.new.read_input).to eq('DOWN')
    end

    it "return left imputing arrow left" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('C')
      expect(Keyboard.new.read_input).to eq('RIGHT')
    end

    it "return right imputing arrow right" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('D')
      expect(Keyboard.new.read_input).to eq('LEFT')
    end

    it "return the key character imputing a letter key" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('a')
      expect(Keyboard.new.read_input).to eq('a')
    end
  end
end
