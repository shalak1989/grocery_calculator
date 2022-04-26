# frozen_string_literal: true

require 'hashie'

class Calculator
  class << self
    GROCERIES = {
      'milk' => Hashie::Mash.new({ price: 3.97, sale_price: 5.00, sale_quantity: 2 }),
      'bread' => Hashie::Mash.new({ price: 2.17, sale_price: 6.00, sale_quantity: 3 }),
      'banana' => Hashie::Mash.new({ price: 0.99 }),
      'apple' => Hashie::Mash.new({ price: 0.89 })
    }.freeze

    def build_purchases_breakdown(purchases)
      grocery_report = {}
      purchases.each do |item|
        grocery_report[item] ? grocery_report[item] += 1 : grocery_report[item] = 1
      end
      grocery_report
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