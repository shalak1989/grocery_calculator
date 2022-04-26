class ReceiptBuilder
  class << self
    def print_receipt(grocery_report)
      puts build_receipt(grocery_report)
    end


    private

    # I would need to do something more complicated to make this work dynamically for any kind of grocery list
    # This was made just to solve this specific use case
    def calculate_spacing(item)
      space_needed = 10 - item.length
      spacer = ""
      space_needed.times do 
        spacer += " "
      end
      spacer
    end

    def build_receipt(grocery_report)
      receipt = "Item     Quantity      Price\n--------------------------------------\n"
      grocery_report.each do |k, v| 
        receipt += "#{k}#{calculate_spacing(k)}#{v}            $#{}\n"
      end

      receipt += "Total price: $#{}\n"
      receipt += "You saved $#{} today.\n"
      receipt
    end
  end
end


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