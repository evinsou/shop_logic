module Shop
	class Rule

		def initialize(product_name, paid_amount, free_amount, new_price = nil)
			@product_name = product_name
      @paid_amount = paid_amount
      @free_amount = free_amount
      @new_price = new_price
		end

    def formula(number, product_price)
      return number * product_price if self.free_amount == 0 # WTF?

      (number / action_amount + number % action_amount) * product_price
    end

    def applies?(name , number)
      self.product_name == name && self.action_amount <= number
    end

    def new_price
      @new_price
    end

    def product_name
      @product_name
    end

    def action_amount
      paid_amount + free_amount
    end

    def paid_amount
      @paid_amount
    end

    def free_amount
      @free_amount
    end
	end
end
  
module Shop
  class DefaultRule < Rule

    def applies?(name , number)
      true
    end

    def formula(number, product_price)
      number * product_price
    end
  end
end

