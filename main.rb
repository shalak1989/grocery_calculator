require_relative 'calculator'
require 'pry'

binding.pry
puts Calculator::GROCERIES['milk'].price

# It was not specified if the sale price should apply for each sale quantity or just once
# Essentially should 4 units of milk be $10 or should it be 5 + 3.97 + 3.97?
# I am assuming since the instructions were not explicit on this that the sale price only applies once


# $ ruby price_calculator.rb
# Please enter all the items purchased separated by a comma
# milk,milk, bread,banana,bread,bread,bread,milk,apple

# Item     Quantity      Price
# --------------------------------------
# Milk      3            $8.97
# Bread     4            $8.17
# Apple     1            $0.89
# Banana    1            $0.99

# Total price : $19.02
# You saved $3.45 today.