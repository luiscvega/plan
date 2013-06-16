class Scrivener
private
  def assert_unique(model, att, error = [att, :not_unique])
    val = send(att)

    assert(model.with(att, val).nil?, error)
  end

  def assert_equal(target, control, error = [target, :not_valid])
    assert(send(target) == send(control), error)
  end

end
