require 'spec_helper'
require_relative '../lib/rule.rb'

describe Shop::Rule do
	context 'some context' do
		it 'returns false' do
			expect(Rule.new('apple')).to be_present
		end
	end
end
