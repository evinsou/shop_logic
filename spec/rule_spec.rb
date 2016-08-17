require 'spec_helper'

describe Shop::Rule do
  let(:rule) { Shop::Rule.new('apple', 2) }

  context '#applies?' do
    it 'applies a rule when a product and an amount match rule conditions' do
      product = Shop::Product.new('apple')
      product.increase_amount
      expect(rule.applies?(product)).to be_truthy
    end

    it 'applies a rule when a product amount exeeds a rule conditions' do
      product = Shop::Product.new('apple')
      2.times { product.increase_amount }
      expect(rule.applies?(product)).to be_truthy
    end

    it 'does not apply a rule when a product mismatch rule conditions' do
      expect(rule.applies?(Shop::Product.new('orange'))).to be_falsy
    end

    it 'does not apply a rule when an amount mismatch rule conditions' do
      expect(rule.applies?(Shop::Product.new('apple'))).to be_falsy
    end
  end

  context '#formula' do
    let(:rule) { Shop::Rule.new('apple', 2) }
    let(:product) { Shop::Product.new('AJ') }

    it 'calculates by simple formula when there is no rule' do
      expect(rule.formula(product)).to eq(7.25)
    end

    it 'calculates by simple formula when two products are without rule' do
      product.increase_amount
      expect(rule.formula(product)).to eq(14.5)
    end

    context 'when there is discount for product' do
      let(:rule) { Shop::Rule.new('AJ', 1, 0, 6.5) }

      it 'calculates correctly when a single product is present' do
        expect(rule.formula(product)).to eq(6.5)
      end
    end

    context 'when there is a free item' do
      let(:rule) { Shop::Rule.new('AJ', 2, 1) }

      it 'calculates correctly when 1 paid product, and 1 free' do
        expect(rule.formula(product)).to eq(7.25)
      end

      it 'calculates correctly when 2 paid products, and 1 free' do
        product.increase_amount
        expect(rule.formula(product)).to eq(14.5)
      end
    end
  end
end
