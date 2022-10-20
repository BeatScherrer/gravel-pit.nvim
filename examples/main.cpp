/** @file
 *
 * test file for syntax highlighting development
 */

#include <iostream>

namespace test_namespace {

struct TestStruct {
  int number;
};

template <typename T> class Example {
public:
  Example(const T &t) : m_member(t) {}

  void sayHello(const std::string &name) { std::cout << "hello!" << std::endl; }

  const T &get() { return m_member; }

private:
  T m_member;
};

} // namespace test_namespace

int main(int argc, char **argv) {
  test_namespace::Example<int> example(4);
  std::cout << example.get() << std::endl;
  std::cout << "hello world" << std::endl;

  test_namespace::TestStruct number;
  number.number = 4;

  return 0;
}
