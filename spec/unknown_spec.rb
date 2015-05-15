require 'spec_helper'

describe Unknown do
  it 'has a version number' do
    expect(Unknown::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
