require 'spec_helper'

describe Shop::CheckoutCalculator do
  let(:item_names) { ['FR', 'SR', 'CF', 'AJ'] }
  let(:item_list) { item_names.map { |pr| Shop::Product.new(pr) } }
  let(:rule_list) { [Shop::Rule.new('CF', 4, 0, 4.5)] }

  it 'contains correct product and its prices' do
    calc = Shop::CheckoutCalculator.new(item_list, rule_list)
    products_sum = calc.yield_sum_by_product
    products_sum.keys.each do |product|
      expect(item_names).to include(product.name)
    end
    expect(products_sum.values).to eq([3.11, 5.0, 11.23, 7.25])
  end
end
