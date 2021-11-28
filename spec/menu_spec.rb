require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    { 
      chicken: 4.99,
      lamb: 4.99
    }
  end
  it 'shows the items with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'pritns out the menue with prices' do
    printed_menu = "Chicken £4.99, Lamb £4.99"
    expect(menu.print).to eq(printed_menu)
    
  end
  
end