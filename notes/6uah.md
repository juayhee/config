# A journey into non-virtual polymorphism

## std::tuple
- container like type
- `get` values
    - from tuple based on position of type in template pack
    - by specifiying their types (if they are unique)

## curiously recurring template pattern
where a class X derives from a **class template instantiation**, but X is used
as the template parameter itself
eg. 
```
template <typename T>
struct S {}

class X : S<X> {}
```

- can avoid virtual functions; this provides compile time polymorphism

## C++23: deducing this
- usually when a member function is called an impliciit `this` parameter is passed
in
- in C++23 you can expose `this`
- no longer have to do CRTP
    - no need to pass the type of the derived class to the parent class

