require_relative 'lib/calculator'
require_relative 'lib/receipt_builder'
require 'pry-nav'

puts "Please enter all the items purchased separated by a comma"
#purchases = gets.chomp.delete(' ').split(',')
purchases = "milk,milk, bread,banana,bread,bread,bread,milk,apple".delete(' ').split(',')

calculator = Calculator.new
calculator.build_grocery_purchase_data(purchases)

ReceiptBuilder.print_receipt(calculator.grocery_report)