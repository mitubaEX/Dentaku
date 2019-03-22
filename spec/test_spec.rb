RSpec.describe Test do
  it "input single number" do
    expect(Test::Calculator.new("1").eval).to eq("1")
  end

  it "input double number" do
    expect(Test::Calculator.new("12").eval).to eq("12")
  end
end
