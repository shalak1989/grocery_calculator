# frozen_string_literal: true

require 'hashie'
require 'pry-nav'

class Calculator
  class << self
    GROCERIES = {
      'milk' => Hashie::Mash.new({ price: 3.97, sale_price: 5.00, sale_quantity: 2 }),
      'bread' => Hashie::Mash.new({ price: 2.17, sale_price: 6.00, sale_quantity: 3 }),
      'banana' => Hashie::Mash.new({ price: 0.99 }),
      'apple' => Hashie::Mash.new({ price: 0.89 })
    }.freeze

    def build_grocery_purchase_data(purchases)
      grocery_report = Hashie::Mash.new(total_purchase_price: 0, total_savings: 0)
      purchases.each do |item|
        update_line_item(grocery_report, item)
      end
      add_summary_data(grocery_report)
      grocery_report
    end

    private
    
    def add_summary_data(grocery_report)
      # do total, sales total should be here already?
    end

    def update_savings_total(grocery_report, discount)
      grocery_report['total_savings'] += discount
    end

    def adjust_for_sales_price(grocery_report, item)
      # I am assuming based on the stated requirements that the sale's price can only apply once and not for each sales quantity
      # I can simply change the total price once if the sales quantity is hit given the assumption that a sales price can only occur once per item
      return unless grocery_report[item].quantity == GROCERIES[item].sale_quantity

      discount = grocery_report[item].line_item_total_price - GROCERIES[item].sale_price
      grocery_report[item].line_item_total_price = GROCERIES[item].sale_price
      update_savings_total(grocery_report, discount)
    end

    def update_line_item_total_price(grocery_report, item)
      grocery_report[item].line_item_total_price += GROCERIES[item].price
      adjust_for_sales_price(grocery_report, item)
    end

    def update_line_item_quantity(grocery_report, item)
      grocery_report[item].quantity += 1
    end

    def update_line_item(grocery_report, item)
      grocery_report[item] = Hashie::Mash.new(quantity: 0, line_item_total_price: 0) unless grocery_report[item]

      update_line_item_quantity(grocery_report, item)
      update_line_item_total_price(grocery_report, item)
    end
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