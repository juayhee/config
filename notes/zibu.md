# Concurrency

## Definition
Multiple logical threads of execution with some inter-task dependencies
    - mix between things that happen
        - procedurally
        - in parallel
        - not at the same time (less stringent requirement than procedurally)

Parallelism: Completely no dependencies between tasks
    - more freedom for scheduler
    - safer than concurrency, prefer if possible

## C++
algorithms that take **execution policies** as first argument

pick the right algorithm!
    - wrong algorithm -> frequent contest for lock leads to poor performance

### std::thread
Creates a new thread

`std::thread my_thread`
- my_thread is a variable in the **main thread**
- handle in the main thread for the child thread
- constructor takes a lambda that specifies what to run
- parent will not wait for child
    - unless `.join()` is called, in which case the parent will wait
- cannot return value from child to parent

- must call either `join` or `detach`

## Data Races
when two or more threads access the same memory
    - and when there is a read/write
    - all reads are obviously okay
avoid data races: making sure memory changes made by a thread are **visible**

## Thread synchronisation
actions that guarantee synchronisation (of memory space / data)
- all memory changes in parent thread before thread creation are visible in the
child thread
- `.join()`
    - but not `.detach()`
- make lock zones **as small as possible**

### Synchronisation techiniques
prefer to 'collect' updates to state and then apply them with the below
techniques
    - lower lock contention

1. Mutexes
    - only one thread can access the mutex-guarded code
    - 'acquire' the lock / mutex

`std::mutex`
    - `lock()`, `unlock()`
        - `lock()` blocks until the thread gets to perform the lock ('acquiring the lock')
            - non-blocking: `try_lock()`
    - synchronisation: anything that happens on thread 1 before it calls unlock()
    is visible to thread 2 after it calls lock()
    - use lock guards instead of explicit lock/unlock
        - is a RAII wrapper aroudn mutexes
            - constructor locks
            - destructor unlocks
    - becomes impossible to 'forget to unlock'
    - prefer `scoped_lock`, then `lock_guard`
        - must be named, otherwise temporary object created

2. Atomics
Guarantees that operations on a variable happen as a unit
synchronisation when the same atomic variable is accessed
    - change in atomic variable is visible

#cpp

    

