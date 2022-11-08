#if __cplusplus >= 201103L
	#define NOEXCEPT noexcept(false)
#else
	#define NOEXCEPT
#endif

#ifdef FUNC_1_SOURCE
#define DECL __declspec(dllexport)
#else
#define DECL __declspec(dllimport)
#endif

struct DECL Foo
{
  ~Foo() NOEXCEPT;
};
