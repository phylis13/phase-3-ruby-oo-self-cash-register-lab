require 'pry'
class CashRegister
    attr_accessor :items, :discount, :total, :last_transaction

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, items = 1)
      self.last_transaction = amount * items
      self.total += self.last_transaction
      items.times { self.items << title }
    end
  
    def apply_discount
      if(self.discount != 0)
        percent_discount = (100.0 - self.discount.to_f) / 100
        self.total = (self.total * percent_discount).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
    end
end

me = CashRegister.new
# binding.pry

