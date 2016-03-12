module Shop
	class Product
		attr_accessor :name

		PRICES = { 'FR' => 3.11, 'SR' => 5.00, 'CF' => 11.23, 'AJ' => 7.25}

		def initialize(name, amount = 1)
			@name = name
      @amount = amount
			@price = PRICES[name]
		end

    def price
      @price
    end

    def amount
      @amount
    end

    def amount=(new_value)
      @amount = new_value
    end
	end
end
