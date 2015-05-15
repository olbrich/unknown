class Complex < Numeric
  def unknown?
    real.unknown? || imaginary.unknown?
  end
end
