require 'test_helper'

class InternalInspectTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::InternalInspect::VERSION
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
