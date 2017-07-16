require 'test_helper'

class InternalInspectTest < Minitest::Test
  def test_special_const_p
    assert 1.special_const?
    assert true.special_const?
    assert false.special_const?
    assert nil.special_const?

    assert !"あ".special_const?
  end

  def test_immediate_p
    assert 1.immediate?
    assert true.immediate?

    assert !false.immediate?
    assert !nil.immediate?
    assert !"あ".immediate?
  end

  def test_static_sym_p
    assert "a".to_sym.static_sym?
    assert !"あ".to_sym.static_sym?
  end

  def test_dynamic_sym_p
    assert "あ".to_sym.dynamic_sym?
    assert !"a".to_sym.dynamic_sym?
  end
end
