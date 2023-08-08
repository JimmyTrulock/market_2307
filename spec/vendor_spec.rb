require './lib/item'
require './lib/vendor'

describe Vendor do
  it 'exist' do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor).to be_a(Vendor)
    expect(vendor.name).to eq("Rocky Mountain Fresh")
    expect(vendor.inventory).to eq({})
  end
end

describe "#stock" do
  it "adds item to inventory" do
    vendor = Vendor.new("Rocky Mountain Fresh")

    expect(vendor.inventory).to eq({})

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor.stock(item1, 30)

    expect(vendor.inventory).to eq({item1 => 30})
  end
end

describe "#check_stock" do
  it "checks inventory for item" do
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expect(vendor.check_stock(item1)).to eq(0)

    vendor.stock(item1, 30)

    expect(vendor.check_stock(item1)).to eq(30)
  end
end

describe '#potential_revenue' do
  it "returns potential revenue based of items quantity and price" do
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    
    expect(vendor1.potential_revenue).to eq(0.0)
    
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    expect(vendor1.potential_revenue).to eq(29.75)
  end
end

describe "item_list" do
  it "returns a list of iteams from the vendor" do
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})

    expect(vendor1.item_list).to eq([])
    
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)

    expect(vendor1.item_list).to eq(["Peach", "Tomato"])
  end
end

