require 'spec_helper'

describe Shop::Checkout do
	let(:items) { ['FR', 'SR', 'CF', 'AJ'] }
	let(:rules) { [] }
	let(:checkout) { Shop::Checkout.new(rules) }

	before { items.each { |item| checkout.scan(item) } }

	it 'returns simple price and number when no rule is apply' do
		expect(checkout.total).to eq 26.59
	end

	context 'when one for free and descount rules present' do
		let(:rules) { [Shop::Rule.new('SR', 3, 0, 4.5),
                    Shop::Rule.new('FR', 1, 1)] }

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

		context 'for discount for strawberry' do
			let(:items) { ['SR', 'SR', 'FR', 'SR'] }

			it 'gets correct sum' do
				expect(checkout.total).to eq 16.61
			end
		end
	end
end
