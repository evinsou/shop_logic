 module Shop
  class DefaultRule < Rule

    def initialize(action_product = '', paid_amount = 0, free_amount = 0, new_price = nil)
      super
    end

    def applies?(item)
      true
    end

    def formula(item)
      common_formula(item.amount, item.price)
    end
  end
end
