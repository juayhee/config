# Exceptions

## General
- expensive
    - allocation for exception objects are done on the heap
    - less performant than stack allocations
    - should probably not be used for minor errors (avoid frequent use that incurs compounding costs)

- conditional rethrows are bad
    - instead prefer return codes
    - eg. instead of throwing exception when a connection fails X number of times
    return a code from the loop and deal with it based on return code
        - exceptions are for **rare events only**!

## Hygeine
- throw by value
    - so that during stack unwinding if the exception is deallocated it still works 
- catch by const reference
- use for **uncommon** errors

## Resource management
- exception can leave function at any time
    - before release of memory -> memory leak
    - expected behaviour: catch exception -> release resource -> rethrow exception

- prefer raii over explicit catch-and-release
    - raii is automatic destructor calling
    - explicit catch and release: what if you miss a path

## Packaging information with exceptions
Can log error with extra information in exception handler (eg. local variables)
and rethrow

Use exception types with a mutable string member type
    - avoids allocations and reallocations for each re-throw since you can just
    pass the same object
    - templatize the mutable type so that different information can be passed
    in the exception class

Alternative for thorwing excpetions when a "find" function does not return
something: use an optional instead

## Exceptional control flow
Instead of each catch block taking a specific action per type of exception,
if stack return is shallow, prefer std::expected with std::variant in one exception type


## Exceptional hierarchies
To avoid having large hierarchies in exception classes, instead throw a child class
eg. `std::runtime_error("some error")` and have one handler that **catches the parent class**
eg. `catch std::exception`.
    - helps to prevent multiple catch clauses where each catch clause is actually
    just doing the same thing for each exception class

- ask: do we really need exception hierarchies?
    - if the only thing that differs is the message the exception is throwing,
    and they are handled the same way, they can be grouped under one exception type

## What is considered 'truly exceptional'?
usages for exceptions:
- error tracing
    - where is the error?
    - where in the stack? `std::stacktrace`
    - where in the code? `std::source_location`
- stack unwinding
    - reset / termination
- data passing / control flow
    - when information needs to be known about the error to manage it
