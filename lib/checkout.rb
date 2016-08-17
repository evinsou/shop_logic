require 'spec_helper'

module Shop
	class Checkout

    attr_reader :item_list, :rule_list

		def initialize(rules)
			@item_list = []
			@rule_list = rules
		end

		def scan(product_name)
      if product = find_by_name(product_name)
        product.increase_amount
      else
        item_list << Shop::Product.new(product_name)
      end
		end

		def total
      collect_product_sums[:total]
		end

		private

    def find_by_name(product_name)
      item_list.detect { |item| item.name == product_name }
    end

    def collect_product_sums
      calc = Shop::CheckoutCalculator.new(item_list, rule_list)
      product_sum = calc.yield_sum_by_product
      total = product_sum.values.inject { |sum, part_sum| sum + part_sum }
      product_sum[:total] = total
      product_sum
    end
	end
end
