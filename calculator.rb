# frozen_string_literal: true

require 'hashie'

class Calculator
  GROCERIES = {
    'milk' => Hashie::Mash.new({ price: 3.97, sale_price: 5.00, sale_quantity: 2 }),
    'bread' => Hashie::Mash.new({ price: 2.17, sale_price: 6.00, sale_quantity: 3 }),
    'banana' => Hashie::Mash.new({ price: 0.99 }),
    'apple' => Hashie::Mash.new({ price: 0.89 })
  }.freeze

  def self.boo
    puts 'boo'
  end
end

# Item     Unit price        Sale price
# --------------------------------------
# Milk      $3.97            2 for $5.00
# Bread     $2.17            3 for $6.00
# Banana    $0.99
# Apple     $0.89
