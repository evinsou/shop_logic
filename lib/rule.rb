module Shop
	class Rule

    attr_reader :new_price,
                :action_product,
                :paid_amount,
                :free_amount

		def initialize(action_product, paid_amount = 1, free_amount = 0, new_price = nil)
			@action_product = action_product
      @paid_amount = paid_amount
      @free_amount = free_amount
      @new_price = new_price
		end

    def applies?(item)
      action_product == item.name && action_amount <= item.amount
    end

    def formula(product)
      number = product.amount
      product_price = new_price || product.price

      num_mult = (number / action_amount + number % action_amount)
      num_mult = number if free_amount == 0

      common_formula(num_mult, product_price)
    end

    private

    def action_amount
      paid_amount + free_amount
    end

    def common_formula(coefficient, price)
      coefficient * price
    end
	end
end
