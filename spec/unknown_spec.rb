require 'spec_helper'

describe Unknown do
  it 'has a version number' do
    expect(UnknownClass::VERSION).not_to be nil
  end

  it 'operators' do
    %w(* / + - **).each do |operator|
      expect( subject.send(operator.to_sym, 100) ).to be_unknown
      expect( 100.send(operator.to_sym, subject) ).to be_unknown
    end
  end

  it 'comparisons' do
    expect { subject > 100 }.to raise_error(ArgumentError)
    expect { subject >= 100 }.to raise_error(ArgumentError)
    expect { subject < 100 }.to raise_error(ArgumentError)
    expect { subject <= 100 }.to raise_error(ArgumentError)
    expect( subject == 100 ).to be false
    expect( subject != 100 ).to be true
    expect( subject <=> 100 ).to be nil
  end
end
