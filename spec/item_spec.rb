require './lib/item'

describe "item" do
  it "exsits" do
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(item1).to be_an(Item)
    expect(item1.name).to eq("Peach")
    expect(item1.price).to eq(0.75)
  end
end