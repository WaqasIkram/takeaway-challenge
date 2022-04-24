require "menu"

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
    kebab: 5.50,
    mix_kebab: 6.60,
    pitta_wrap: 5.50,
    chips: 3.50
    }

  end
  it "It has dishes's list with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints out the dishes with prices" do
    printed_menu = "Kebab £5.50, Mix_kebab £6.60, Pitta_wrap £5.50, Chips £3.50"
    expect(menu.print).to eq(printed_menu)
  end

  it "tells if the dish is on the menu" do
    expect(menu.has_dish?(:kebab)).to be true
  end

  it "tells if the dish is NOT on the menu" do
    expect(menu.has_dish?(:eggs)).to be false
  end

  it "calculates the price" do
    expect(menu.price(:kebab)).to eq(dishes[:kebab])
  end
end