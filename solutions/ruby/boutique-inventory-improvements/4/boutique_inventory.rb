class BoutiqueInventory
  attr_reader :items, :item_names, :total_stock
  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
    @item_names = @items.map(&:name).sort
    @total_stock = @items.sum { |item| item.quantity_by_size.values.sum }
  end
end