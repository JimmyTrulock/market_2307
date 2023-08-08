class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    vendors_selling = []
    vendors.each do |vendor|
      if vendor.inventory.has_key?(item) 
        vendors_selling << vendor
      end
    end
    vendors_selling
  end

  def sorted_item_list
    list_of_items = []
    @vendors.each do |vendor|
      list_of_items << vendor.item_list
    end
    list_of_items.flatten.uniq.sort
  end

  def total_inventory
  inventory_list = @vendors.each_with_object(Hash.new) do |vendor, inventory_list|
      vendor.inventory.each do |item, quantity|
        if inventory_list[item]
          inventory_list[item][quantity] += quantity
          inventory_list[item][vendors] << vendor
        else
          new_item = (Hash.new)
          new_item[quantity] = quantity += 1
          new_item[vendors] = [] << vendor
          inventory_list[item] = new_item
        end
      end
    end
    inventory_list
  end
end