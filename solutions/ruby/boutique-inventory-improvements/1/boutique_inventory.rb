require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    # Ensure each item is an OpenStruct for dot-notation access
    @items = items.map { |i| OpenStruct.new(i) }
  end

  def item_names
    # Access using dot notation and return sorted list
    items.map(&:name).sort
  end

  def total_stock
    # Sum up all quantities across all sizes for all items
    items.sum { |item| item.quantity_by_size.values.sum }
  end
end
