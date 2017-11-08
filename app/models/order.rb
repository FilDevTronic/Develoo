class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_validation :set_order_status, on: :create
  before_save :update_subtotal
  before_save :update_tax
  before_save :update_total

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_tax
    self[:tax] = self[:subtotal] * 0.10
  end

  def update_total
    self[:total] = self[:subtotal] + self[:tax]
  end
end
