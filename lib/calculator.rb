# frozen_string_literal: true

require 'hashie'
require 'pry-nav'

class Calculator
  GROCERIES = {
    'milk' => Hashie::Mash.new({ price: 3.97, sale_price: 5.00, sale_quantity: 2 }),
    'bread' => Hashie::Mash.new({ price: 2.17, sale_price: 6.00, sale_quantity: 3 }),
    'banana' => Hashie::Mash.new({ price: 0.99 }),
    'apple' => Hashie::Mash.new({ price: 0.89 })
  }.freeze

  attr_accessor :grocery_report

  def initialize
    @grocery_report = Hashie::Mash.new(total_purchase_price: 0, total_savings: 0)
  end

  def build_grocery_purchase_data(purchases)
    purchases.each do |item|
      update_line_item(item)
    end
  end

  private

  def adjust_total_report_price(amount)
    grocery_report.total_purchase_price += amount
  end

  def update_savings_total(discount)
    grocery_report.total_savings += discount
  end

  def on_sale?(item)
    grocery_report[item].quantity == GROCERIES[item].sale_quantity
  end

  def on_sale_workflow(item)
    discount = grocery_report[item].line_item_total_price - GROCERIES[item].sale_price
    update_savings_total(discount)
    grocery_report[item].line_item_total_price -= discount
    adjust_total_report_price(-discount)
  end

  def update_line_item_total_price(item)
    on_sale_workflow(item) && return if on_sale?(item)

    grocery_report[item].line_item_total_price += GROCERIES[item].price
    adjust_total_report_price(GROCERIES[item].price)
  end

  def update_line_item_quantity(item)
    grocery_report[item].quantity += 1
  end

  def update_line_item(item)
    grocery_report[item] = Hashie::Mash.new(quantity: 0, line_item_total_price: 0) unless grocery_report[item]

    update_line_item_quantity(item)
    update_line_item_total_price(item)
  end
end

# Item     Unit price        Sale price
# --------------------------------------
# Milk      $3.97            2 for $5.00
# Bread     $2.17            3 for $6.00
# Banana    $0.99
# Apple     $0.89

# It was not specified if the sale price should apply for each sale quantity or just once
# Essentially should 4 units of milk be $10 or should it be 5 + 3.97 + 3.97?
# I am assuming since the instructions were not explicit on this that the sale price only applies once
