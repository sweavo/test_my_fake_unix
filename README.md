# Fake unix envrionment tests

These scripts check certain aspects of unix-like build environments, in 
particular, problems I've found with MSys down the years.  This will allow us
to evaluate alternatives, like cygwin, msys2, wsl, etc.

## To commission the tests on your environment

* Edit paths.source to ensure that it supports your target. You may need to add
  an `if [[ "X$OSTYPE" -eq ...` line.

