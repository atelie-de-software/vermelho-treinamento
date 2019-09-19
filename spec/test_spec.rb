require './src/test'

RSpec.describe Test do
  describe "method #truthy" do
    subject { Test.new.is_truthy }

    it "return truthy" do
      expect(subject).to be_truthy
    end
  end
end
