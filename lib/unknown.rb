require "unknown/version"
require 'unknown/extensions/numeric'
require 'unknown/extensions/complex'
require 'unknown/extensions/math'
#require 'unknown/extensions/nil'

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
    [self, self]
  end

  # operators
  def round(_=nil)
    self
  end

  def divmod(_)
    [self, self]
  end

  # arity 1
  %w(* / + - ** fdiv modulo quo remainder).each do |meth|
    define_method(meth.to_sym) do |_|
      self
    end
  end

  # arity 0
  %w(
    +@
    -@
    abs
    abs2
    angle
    arg
    ceil
    conj
    conjugate
    denominator
    floor
    i
    imag
    imaginary
    magnitude
    numerator
    phase
    to_c
    to_f
    to_i
    to_r
    truncate
  ).each do |meth|
    define_method(meth.to_sym) do
      self
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
end

Unknown = ::UnknownClass.new
