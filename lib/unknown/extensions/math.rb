module Math
  %w(acos acosh cos cosh asin asinh sin sinh atan tan atanh tanh sqrt cbrt exp erf erfc gamma log log2).each do |meth|
    original_method = "#{meth}_without_unknown".to_sym
    alias_method original_method, meth.to_sym
    define_method(meth.to_sym) do |other|
      return Unknown if other.unknown?
      send("#{meth}_without_unknown", other)
    end
    module_function original_method
    module_function meth.to_sym
  end

  %w(hypot atan2).each do |meth|
    original_method = "#{meth}_without_unknown".to_sym
    alias_method original_method, meth.to_sym
    define_method(meth.to_sym) do |a,b|
      return Unknown if a.unknown? || b.unknown?
      send("#{meth}_without_unknown", a, b)
    end
    module_function original_method
    module_function meth.to_sym
  end
end
