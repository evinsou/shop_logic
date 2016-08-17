module Shop
  class CheckoutCalculator

    attr_reader :item_list, :rule_list

    def initialize(items, rules)
      @item_list = items
      @rule_list = rules
    end

    def yield_sum_by_product
      item_list.each_with_object({}) do |item, product_sum|
        product_sum[item] = get_rule(item).formula(item)
      end
    end

    private

    def get_rule(item)
      rule_list.detect { |rule| rule.applies?(item) } ||
        Shop::DefaultRule.new(item)
    end
  end
end
