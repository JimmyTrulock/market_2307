require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  it "exsit" do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market).to be_a(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end
end

describe "#add_vendor" do
  it "adds vendor to vendors list" do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market.vendors).to eq([])

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)

    expect(market.vendors).to eq([vendor1])
  end
end

describe '#vendor_names' do
  it "returnse list of vendor names" do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market.vendor_names).to eq([])

    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
end

describe '#vendors_that_sell' do
  it 'returns list of vendors that sell a specific item' do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    market.add_vendor(vendor1)

    expect(market.vendors_that_sell(item1)).to eq([])

    vendor1.stock(item1, 35)

    expect(market.vendors_that_sell(item1)).to eq([vendor1])
  end
end

describe "#sorted_item_list" do
  it "returns an array of the names of all items the Vendors have in stock, sorted alphabetically" do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    
    expect(market.sorted_item_list).to eq([])
    
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 35)
    vendor2.stock(item2, 35)
    vendor2.stock(item3, 35)

    expect(market.sorted_item_list).to eq(["Banana Nice Cream","Peach", "Tomato"])
  end
end

describe "#total_inventory" do 
  it "returns the quantities of all items sold at the market" do
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)

    expect(market.total_inventory).to eq({})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 35)
    vendor2.stock(item2, 35)
    vendor2.stock(item3, 35)

    expect(market.total_inventory).to eq({})
  end
end