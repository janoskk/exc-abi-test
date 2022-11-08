#include <iostream>
#include <stdexcept>

#include "func_1.h"

int main()
try
{
  std::set_terminate([]{
      std::cout << "Unhandled exception! ABORTING\n" << std::flush;
      std::abort();
  });

  Foo foo;

  return 0;
}
catch(...)
{
  std::cout << "Main catch called." << std::endl;
}
