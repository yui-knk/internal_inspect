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

  def test_flags
    assert "".flags.is_a?(Integer)
    assert [].flags.is_a?(Integer)
  end

  def test_ruby_value_type
    assert_equal  5, "".ruby_value_type
    assert_equal  7, [].ruby_value_type
    assert_equal 17, nil.ruby_value_type
    assert_equal 18, true.ruby_value_type
    assert_equal 19, false.ruby_value_type
    assert_equal 20, :a.ruby_value_type
    assert_equal 21, 1.ruby_value_type
  end
end
