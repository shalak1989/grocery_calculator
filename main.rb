require_relative 'lib/purchase_report'
require_relative 'lib/receipt_builder'
require 'pry-nav'

puts 'Please enter all the items purchased separated by a comma'

# Comment out for testing
purchases = gets.chomp.delete(' ').split(',')

# Uncomment for testing
# purchases = "milk,milk, bread,banana,bread,bread,bread,milk,apple".delete(' ').split(',')

purchase_report = PurchaseReport.new

purchase_report.build_grocery_purchase_data(purchases)

puts ReceiptBuilder.build_receipt(purchase_report)
