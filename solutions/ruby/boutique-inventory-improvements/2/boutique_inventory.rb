require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    # Ensure each item is an OpenStruct for dot-notation access
    @items = items.map do |i|
      OpenStruct.new(
        i.merge(
          total_quantity: i[:quantity_by_size].values.sum
        )
      )
    end
  end

  def item_names
    # Access using dot notation and return sorted list
    items.map(&:name).sort
  end

  def total_stock
    # Sum up all quantities across all sizes for all items
    items.sum(&:total_quantity)
  end
end


