require "byebug"
require 'spec_helper'
require_relative '../lib/product.rb'

module Shop
	class Checkout

		def initialize(rules)
			@item_list = []
			@rules = rules
		end

		def scan(product_name)
			if current_product = find_by_name(product_name)
				current_product.amount += 1
			else
				item_list << Shop::Product.new(product_name)
			end
		end
						
		def total
			product_sum = {}

			item_list.each do |item|
				if rule = get_rule(item.name, item.amount)
					product_price = (rule.new_price || item.price)

					total = rule.formula(item.amount, product_price)
				else
					total = item.price * item.amount
				end
				product_sum[item.name] = total
			end
			sum = 0

			product_sum.values.each { |i| sum += i }

			sum
		end

		private

		def item_list
			@item_list
		end

		def find_by_name(product_name)
			item_list.detect { |item| item.name == product_name }
		end

		def get_rule(product_name, number)
			@rules.detect { |rule| rule.applies?(product_name, number) }
		end
	end
end
