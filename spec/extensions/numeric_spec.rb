require 'spec_helper'

describe "Numerics" do
  it 'should not be unknown' do
    expect(1).not_to be_unknown
    expect(1/2).not_to be_unknown
    expect(1.0).not_to be_unknown
    expect(0x00A).not_to be_unknown
  end
end
