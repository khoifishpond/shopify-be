class Item < ApplicationRecord
  belongs_to :warehouse

  def warehouse_name
    warehouse.name
  end
end
