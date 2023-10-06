# Object lifetimes: from start to finish

## Storage duration
reference: [basic.life]

## Lifetimes
begins when:
1. storage for an object is obtained
2. the constructor completes (initialisation completes)
    - constructor must fully complete (proceed to ending brace)

ends when:
- automatic: destructor called at end of declaring scope (at ending brace)
- dynamic: until end of program or explcitly `delete`d
    - destructor not called even if scope ends
    - pointer goes out of scope at ending brace, but memory is not freed

### Order of destructor invocation
Destructors for objects are called in **reverse order** of their order of
initialisation


## RAII
Basic concept: Tie resource acquisition and deallocation to object lifetime
- so that when object lifetime ends, resource is deallocated automatically
    - 'automatically' as a result of the **destructor** being called because
    lifetime ended
    - raw pointers do not have destructors automatically called

## Temporary objects
Reference: [class.temporary]
Temporary objects destroyed at end of expression (;) -> analogous to objects being
destroyed at end of scope (})
- expressions are **delimited by ;**

6.1 - A temporary object bound to a reference parameter in a function call persists
until the completion of the full-expression containing the call

6.7.7 - special case for for loops

`Foo x = fun();`
- fun() frame created
- fun() evaluates to return statement
- fun()'s return object is deposited in the return value slot
- return of control flow to expression
- x initialised with return value (via some constructor)
- return object is destroyed (fun() frame removed)
    - fundamental reason why the lifetime of the return object ends at end of expression


visualisation of statements in C++: imagine each statement 'expanding' out into
lines of assembly
- procedural characterstic

#c++
