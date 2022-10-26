#include <iostream>
#include <stdexcept>
#include <thread>

 __declspec(dllimport) void func_2();

int main()
{
  //std::this_thread::sleep_for(std::chrono::seconds(20));

  std::cout << "Before any function call" << std::endl;
  try
  {
    func_2();
  }
  catch(...)
  {
    std::cout << "main catch" << std::endl;
  }
  std::cout << "ALL SET." << std::endl;
  return 0;
}
