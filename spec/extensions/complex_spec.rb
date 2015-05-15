require 'spec_helper'

describe Complex do
  it 'should be unknown if one of the components is' do
    expect(Complex(1,1)).not_to be_unknown
    expect(Complex(1,Unknown)).to be_unknown, 'should be Unknown because imaginary part is unknown'
    expect(Complex(Unknown,1)).to be_unknown, 'should be Unkonwn because the real part is unknown'
  end
end

