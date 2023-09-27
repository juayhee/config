# Bash Snippets

## Get the absolute path to the current directory
`$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")`

- [BASH_SOURCE reference](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-BASH_005fSOURCE)
    - `BASH_SOURCE[0]`: name of current script being executed
    - `$(dirname "${BASH_SOURCE[0]}")`: gets the relative path to the current script
    - `realpath`: convert to absolute path

#tips #bash


