require "spec_helper"

RSpec.configure do |c|
  c.include GuessHelper
end

describe GuessHelper do
  describe "make_a_guess" do
    context "when the height is less than 62 inches" do
      it "returns female" do
        result = make_a_guess(61,101)
        expect(result).to eq(:female)
      end
    end
    context "when the height is greater than 72 inches" do
      it "returns male" do
        result = make_a_guess(73,101)
        expect(result).to eq(:male)
      end
    end
    
    context "when the height is greater or equal to 62 inches" do
      context "and the weight is less than 128 " do
        it "returns female" do
          result = make_a_guess(62, 127)
          expect(result).to eq(:female)
        end
      end

      context "and the weight is greater or equal than 143 " do
        it "returns male" do
          result = make_a_guess(62, 144)
          expect(result).to eq(:male)
        end
      end
    end
  end

end
