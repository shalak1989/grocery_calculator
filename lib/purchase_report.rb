# frozen_string_literal: true

require 'hashie'
require 'pry-nav'

class PurchaseReport
  attr_reader :grocery_report, :total_price_without_savings, :total_savings, :total_price_with_savings

  GROCERIES = {
    'milk' => Hashie::Mash.new({ price: 3.97, sale_price: 5.00, sale_quantity: 2 }),
    'bread' => Hashie::Mash.new({ price: 2.17, sale_price: 6.00, sale_quantity: 3 }),
    'banana' => Hashie::Mash.new({ price: 0.99 }),
    'apple' => Hashie::Mash.new({ price: 0.89 })
  }.freeze

  def initialize
    @grocery_report = {}
    @total_price_without_savings = 0
    @total_savings = 0
    @total_price_with_savings = 0
  end

  def build_grocery_purchase_data(purchases)
    purchases.each do |item|
      update_line_item(item)
    end
    set_price_with_savings
  end

  def adjust_total_report_price(amount)
    @total_price_without_savings += amount # why are you fucking stupid?
  end

  def set_price_with_savings
    @total_price_with_savings = @total_price_without_savings - @total_savings
  end

  # def adjust_total_report_price(amount)
  #   binding.pry
  #   total_price_without_savings += amount # why are you fucking stupid?
  # end

  def update_savings_total(discount)
    @total_savings += discount
  end

  def on_sale?(item)
    @grocery_report[item].quantity == GROCERIES[item].sale_quantity
  end

  def on_sale_workflow(item)
    discount = (GROCERIES[item].price * @grocery_report[item].quantity - GROCERIES[item].sale_price).round(2)
    update_savings_total(discount)
    @grocery_report[item].line_item_total_price = GROCERIES[item].sale_price
  end

  def update_line_item_total_price(item)
    if on_sale?(item)
      on_sale_workflow(item)
    else
      @grocery_report[item].line_item_total_price += GROCERIES[item].price
    end
    adjust_total_report_price(GROCERIES[item].price) # Discounts will be shown later
  end

  def update_line_item_quantity(item)
    @grocery_report[item].quantity += 1
  end

  def update_line_item(item)
    @grocery_report[item] = Hashie::Mash.new(quantity: 0, line_item_total_price: 0) unless @grocery_report[item]

    update_line_item_quantity(item)
    update_line_item_total_price(item)
  end
end
