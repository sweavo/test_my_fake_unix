# RTE build envrionment tests

This is for testing bash environments for the things that RTE team has 
discovered to be problematic down the years, for example:

* Fake unixes can take a long time to fork()
* Unix on top of windows can fail to delete files, while reporting success


