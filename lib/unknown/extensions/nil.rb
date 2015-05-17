# This is perhaps a bit dangerous.  When nils are used in math functions, it will type cast
# to an Unknown object
class NilClass
  def unknown?
    false
  end

  %w(* / - + **).each do |operator|
    define_method(operator.to_sym) do |_|
      Unknown
    end
  end

  %w(-@ +@).each do |operator|
    define_method(operator.to_sym) do
      Unknown
    end
  end

  def coerce(_)
    [Unknown, Unknown]
  end
end
