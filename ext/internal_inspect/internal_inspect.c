#include "internal_inspect.h"
#include <ruby.h>

VALUE rb_mInternalInspect;

static VALUE
special_const_p(VALUE self)
{
  return RB_SPECIAL_CONST_P(self) ? Qtrue : Qfalse;
}

static VALUE
immediate_p(VALUE self)
{
  return RB_IMMEDIATE_P(self) ? Qtrue : Qfalse;
}

static VALUE
static_sym_p(VALUE self)
{
	return RB_STATIC_SYM_P(self) ? Qtrue : Qfalse;
}

static VALUE
dynamic_sym_p(VALUE self)
{
	return RB_DYNAMIC_SYM_P(self) ? Qtrue : Qfalse;
}


void
Init_internal_inspect(void)
{
  rb_mInternalInspect = rb_define_module("InternalInspect");

  rb_define_method(rb_mKernel, "special_const?", special_const_p, 0);
  rb_define_method(rb_mKernel, "immediate?", immediate_p, 0);

  rb_define_method(rb_cSymbol, "static_sym?", static_sym_p, 0);
  rb_define_method(rb_cSymbol, "dynamic_sym?", dynamic_sym_p, 0);
}
