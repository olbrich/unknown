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

  def if_unknown?(value=nil, &block)
    if block_given?
      yield
    else
      value
    end
  end

  def if_known?(&block)
    self
  end

  def inspect(*_)
    "Unknown"
  end
  alias_method :to_s, :inspect

  def coerce(_)
    [self, self]
  end

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

  def <=>(_)
    nil
  end
end

Unknown = ::UnknownClass.new
