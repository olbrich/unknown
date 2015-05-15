require 'spec_helper'

describe Math do
  specify 'trig functions' do
    %w(cos cosh sin sinh tan tanh sqrt cbrt).each do |meth|
      expect(Math.send(meth.to_sym, 90)).not_to be_unknown
      expect(Math.send(meth.to_sym, Unknown)).to be_unknown
    end

    %w(hypot atan2).each do |meth|
      expect(Math.send(meth.to_sym, 3, 4)).not_to be_unknown
      expect(Math.send(meth.to_sym, Unknown, 2)).to be_unknown
      expect(Math.send(meth.to_sym, 2, Unknown)).to be_unknown
    end
  end
end
