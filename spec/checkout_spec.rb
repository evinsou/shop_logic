require 'spec_helper'
require_relative '../lib/checkout.rb'
require_relative '../lib/rule.rb'

describe Shop::Checkout do
	context 'some context' do
		let(:items) { ['FR', 'SR', 'CF', 'AJ'] }
		let(:rules) { [] }
		let(:checkout) { Shop::Checkout.new(rules) }
		before do
			items.each { |item| checkout.scan(item) }
		end

		it 'returns simple price and number when no rule is apply' do
			expect(checkout.total).to eq 26.59
		end

		context 'when one for free and descount rules present' do
			let(:rules) { [Shop::Rule.new('SR', 3, 0, 4.5), Shop::Rule.new('FR', 1, 1)] }

			context 'when one fruit tea is free' do
				let(:items) { ['FR', 'SR', 'FR', 'FR', 'CF'] }

				it 'gets correct sum' do
					expect(checkout.total).to eq 22.45
				end
			end

			context 'when one for free rule' do
				let(:items) { ['FR', 'FR'] }

				it 'gets correct sum' do
					expect(checkout.total).to eq 3.11
				end
			end

			context 'when discount for strawberry' do
				let(:items) { ['SR', 'SR', 'FR', 'SR'] }

				it 'gets correct sum' do
					expect(checkout.total).to eq 16.61
				end
			end
		end

		it 'returns another sum'

		it 'parses when time of purchse, time by day and by day of the week'

		it 'parses when two different in the list'

		it 'returns a list like check with product and number of it'
	end
end
