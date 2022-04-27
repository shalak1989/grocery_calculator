class ReceiptBuilder
  class << self
    def build_receipt(purchase_report)
      receipt = "Item     Quantity      Price\n--------------------------------------\n"
      purchase_report.grocery_report.each do |k, v|
        receipt += "#{k}#{calculate_spacing(k)}#{v.quantity}            $#{v.line_item_total_price}\n"
      end

      receipt += "Total price: $#{purchase_report.total_price_with_savings}\n"
      receipt += "You saved $#{purchase_report.total_savings} today.\n"
      receipt
    end

    private

    # I would need to do something more complicated to make this work dynamically for any kind of grocery list
    # This was made just to solve this specific use case
    def calculate_spacing(item)
      space_needed = 10 - item.length
      spacer = ''
      space_needed.times do
        spacer += ' '
      end
      spacer
    end
  end
end
