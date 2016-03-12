require 'spec_helper'
require_relative '../lib/product.rb'

describe Shop::Product do
	context 'some context' do
		let(:product) { Shop::Product.new('apple') }

		it 'returns correct name' do
			expect(product.name).to eq 'apple'
		end
	end
end
