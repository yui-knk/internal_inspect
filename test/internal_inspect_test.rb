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

    assert_nil 1.flags
    assert_nil :a.flags
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

  def test_fl_user0
    # fl_user0 is used as a singleton_class flag.
    assert_equal true,  "".singleton_class.fl_user0
    assert_equal false, "".fl_user0
  end

  def test_fl_user1
    # fl_user1 is used as an ARRAY EMBED FLAG in Array.
    assert_equal true,  [].fl_user1
    assert_equal true,  [1].fl_user1
    assert_equal true,  [1, 2].fl_user1
    assert_equal true,  [1, 2, 3].fl_user1
    assert_equal false, [1, 2, 3, 4].fl_user1
  end
end
