module Math
  %w(
  acos
  acosh
  asin
  asinh
  atan
  atanh
  cbrt
  cos
  cosh
  erf
  erfc
  exp
  gamma
  log
  log2
  sin
  sinh
  sqrt
  tan
  tanh
  ).each do |original_method|
    method_without_unknown = "#{original_method}_without_unknown".to_sym
    alias_method(method_without_unknown, original_method.to_sym)
    define_method(original_method.to_sym) do |arg|
      return Unknown if arg.unknown?
      send(method_without_unknown, arg)
    end
    module_function method_without_unknown
    module_function original_method.to_sym
  end

  # arity 2
  %w(hypot atan2).each do |original_method|
    method_without_unknown = "#{meth}_without_unknown".to_sym
    alias_method method_without_unknown, original_method.to_sym
    define_method(original_method.to_sym) do |arg1,arg2|
      return Unknown if arg1.unknown? || arg2.unknown?
      send(method_without_unknown, arg1, arg2)
    end
    module_function method_without_unknown
    module_function original_method.to_sym
  end
end
