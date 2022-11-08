#include "func_1.h"

Foo::~Foo() NOEXCEPT
{
  throw 1;
}
