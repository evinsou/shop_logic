module Shop
	class Product
		attr_accessor :name, :amount
    attr_reader :price

		PRICES = { 'FR' => 3.11, 'SR' => 5.00, 'CF' => 11.23, 'AJ' => 7.25 }

		def initialize(name)
			@name = name
      @amount = 1
			@price = PRICES[name]
		end

    def increase_amount
      self.amount += 1
    end
	end
end
