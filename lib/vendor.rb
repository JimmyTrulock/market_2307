class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = (Hash.new(0))
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end
  
  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |key, value|
      revenue += key.price * value
    end
    revenue
  end

  def item_list
    list = []
    @inventory.each_key do |key|
      list << key.name
    end
    list
  end
end