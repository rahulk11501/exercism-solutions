class BoutiqueInventory
  attr_reader :items, :item_names, :cheap, :out_of_stock, :total_stock

  def initialize(items)
    @items = items
    @item_names = items.map { |i| i[:name] }.sort
    @cheap = items.select { |i| i[:price] < 30 }
    @out_of_stock = items.select { |i| i[:quantity_by_size].empty? }
    @total_stock = items.sum { |i| i[:quantity_by_size].values.sum }
  end

  def stock_for_item(name)
    items.find { |i| i[:name] == name }[:quantity_by_size]
  end
end
