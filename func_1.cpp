#include <stdexcept>
#include <iostream>

namespace ns {
class my_exc : public std::runtime_error {
public:
  my_exc() : std::runtime_error("my exc") {};
};

class A {
public:
  A(){}
  void func() {
    std::cout << "A::func() is throwing..." << std::endl;
    try
    {
      throw my_exc();
    }
    catch(...)
    {
      delete this;
      throw;
    }
  }
};
}

__declspec(dllexport) void func_1()
{
  ns::A *a = new ns::A();
  try
  {
    a->func();
  }
  catch(...)
  {
    std::cout << "func_1 catch, rethrowing..." << std::endl;
    throw;
  }
}
