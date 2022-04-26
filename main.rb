require_relative 'lib/calculator'
require_relative 'lib/receipt_builder'
require 'pry-nav'

#puts Calculator::GROCERIES['milk'].price



def calculate_item_grocery_report(groceries)
  puts groceries
  #Calculator::GROCERIES[item_key].price * quantity
end

puts "Please enter all the items purchased separated by a comma"
#purchases = gets.chomp.delete(' ').split(',')
purchases = "milk,milk, bread,banana,bread,bread,bread,milk,apple".delete(' ').split(',')

grocery_report = Calculator.build_purchases_breakdown(purchases)



#calculate_item_grocery_report(grocery_report)

ReceiptBuilder.print_receipt(grocery_report)