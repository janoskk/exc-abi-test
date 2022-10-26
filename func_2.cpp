#include <iostream>

__declspec(dllimport) void func_1();

__declspec(dllexport) void func_2()
try
{
  func_1();
}
catch(...)
{
  std::cout << "func_2 catch, rethrowing..." << std::endl;
  throw;
}