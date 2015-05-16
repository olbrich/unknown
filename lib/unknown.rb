require "unknown/version"
require 'unknown/extensions/numeric'
require 'unknown/extensions/complex'
require 'unknown/extensions/math'

# A numeric class that encapsulates the idea of an unknown number.
# Any math operation that includes an unknown is also Unknown
# this allows complex math functions to run without throwing execptions
# but the end result will be unknown if any of the values in the formula are also Unknown
class UnknownClass < Numeric
  def unknown?
    true
  end

  def if_unknown?(&block)
    yield self
  end

  def if_known?(&block)
    self
  end

  def inspect
    "Unknown"
  end
  alias_method :to_s, :inspect

  def coerce(_)
    [unknown, unknown]
  end

  # operators
  def *(_)
    Unknown
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

  %w(to_f to_i to_c to_r).each do |meth|
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

Unknown = ::UnknownClass.new
