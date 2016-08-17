require 'spec_helper'

describe Shop::Product do

	it 'returns a correct product' do
    product = Shop::Product.new('FR')
		expect(product.name).to eq('FR')
    expect(product.price).to eq(3.11)
    expect(product.amount).to eq(1)
	end

  it 'returns a correct product' do
    product = Shop::Product.new('SR')
    expect(product.name).to eq('SR')
    expect(product.price).to eq(5.0)
    expect(product.amount).to eq(1)
  end

  it 'returns a correct product' do
    product = Shop::Product.new('CF')
    expect(product.name).to eq('CF')
    expect(product.price).to eq(11.23)
    expect(product.amount).to eq(1)
  end

  it 'returns a correct product' do
    product = Shop::Product.new('AJ')
    expect(product.name).to eq('AJ')
    expect(product.price).to eq(7.25)
    expect(product.amount).to eq(1)
  end
end
