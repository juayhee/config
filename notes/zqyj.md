# Compiler optimisations

front end (parser) -> IR -> backend (assemble to machine language)
    - backend operates and optimises IR

- choice of intermediate representation (IR) affects optimisation

## Optimising IRs
inside IR, there are assignments (SSAs)

- use **peephole optimisation** to remove lines of IR until no more
optimisations can be made
    - do multiple passes
- [SSA and its optimisations](#https://en.wikipedia.org/wiki/Static_single-assignment_form)

- can see IR emitted output from [compiler explorer](dhrs.md)

easy to see where things are allocated but never used again

## Effect on UB
what the C++ language standard considers UB allows compilers to evaluate and
do an arbitrary translation to machine code
    - also allowed to do any optimisation
    - reason for unexpected results

eg. when compiler sees divide by 0 in a function, its UB -> compiler allowed
to make the function return anything / do anything

