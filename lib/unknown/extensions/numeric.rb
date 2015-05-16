class Numeric
  def unknown?
    false
  end

  def known?
    !unknown?
  end

  def if_unknown?
    self
  end

  def if_known?(&block)
    yield self
  end

end
