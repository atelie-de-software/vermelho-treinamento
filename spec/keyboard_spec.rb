require './classes/keyboard'

RSpec.describe Keyboard do
  describe "method #read_input" do
    xit "return UP imputing arrow up" do
      allow_any_instance_of(Keyboard).to receive(:get_input).and_return('A')
    end

    xit "return DOWN imputing arrow down" do
    end

    xit "return left imputing arrow left" do
    end

    xit "return right imputing arrow right" do
    end
  end
end
