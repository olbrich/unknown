require 'pry'
require "unknown/version"
require 'unknown/extensions/numeric'
require 'unknown/extensions/complex'

# A numeric class that encapsulates the idea of an unknown number.
# Any math operation that includes an unknown is also unknown
# this allows complex math functions to run without throwing execptions
# but the end result will be unknown if any of the values in the formula are also unknown
class Unknown < Numeric
  def unknown?
    true
  end

  def coerce(_)
    [unknown, unknown]
  end

  # operators
  def *(_)
    unknown
  end

  def /(_)
    unknown
  end

  def +(_)
    unknown
  end

  def -(_)
    unknown
  end

  def **(_)
    unknown
  end

  %w(floor ceil +@ -@).each do |meth|
    define_method(meth.to_sym) do
      unknown
    end
  end

  #comparisons

  %w(> >= < <=).each do |operator|
    define_method(operator.to_sym) do |other|
      fail ArgumentError, "Comparison of #{other.class} with #{self.class.name} failed"
    end
  end

  def eq?(other)
    other.unknown?
  end

  private

  def unknown
    self.class.new
  end
end
