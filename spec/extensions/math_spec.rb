require 'spec_helper'

describe Math do
  specify 'trig functions' do
    %w(acos acosh cos cosh asin asinh sin sinh atan tan atanh tanh sqrt cbrt exp erf erfc gamma log log2).each do |meth|
      expect(Math.send(meth.to_sym, 1)).not_to be_unknown
      expect(Math.send(meth.to_sym, Unknown)).to be_unknown
    end

    %w(hypot atan2).each do |meth|
      expect(Math.send(meth.to_sym, 3, 4)).not_to be_unknown
      expect(Math.send(meth.to_sym, Unknown, 2)).to be_unknown
      expect(Math.send(meth.to_sym, 2, Unknown)).to be_unknown
    end
  end
end
