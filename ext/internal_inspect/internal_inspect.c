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

static VALUE
object_flags(VALUE self)
{
    VALUE flags = RBASIC(self)->flags;
    return INT2NUM(flags);
}

static VALUE
object_ruby_value_type(VALUE self)
{
    /* We can not use BUILTIN_TYPE directly,
     * because BUILTIN_TYPE does not take care of
     * IMMEDIATE values.
     */
    int type = rb_type(self);
    return INT2FIX(type);
}

static VALUE
object_fl_user0(VALUE self)
{
    VALUE flags = RBASIC(self)->flags;
    return (flags & FL_USER0) ? Qtrue : Qfalse;
}

static VALUE
object_fl_user1(VALUE self)
{
    VALUE flags = RBASIC(self)->flags;
    return (flags & FL_USER1) ? Qtrue : Qfalse;
}

void
Init_internal_inspect(void)
{
    rb_mInternalInspect = rb_define_module("InternalInspect");

    rb_define_method(rb_mKernel, "special_const?", special_const_p, 0);
    rb_define_method(rb_mKernel, "immediate?", immediate_p, 0);

    rb_define_method(rb_cSymbol, "static_sym?", static_sym_p, 0);
    rb_define_method(rb_cSymbol, "dynamic_sym?", dynamic_sym_p, 0);

    rb_define_method(rb_cObject, "flags", object_flags, 0);
    rb_define_method(rb_cObject, "ruby_value_type", object_ruby_value_type, 0);
    rb_define_method(rb_cObject, "fl_user0", object_fl_user0, 0);
    rb_define_method(rb_cObject, "fl_user1", object_fl_user1, 0);
}
