MobValueStore
=============
A MobProgramming workshop first held at the Stockholm Elixir meetup 2014-11-27.

You need to use TDD.

You need to switch the driver every X minutes (typically 5-10 depending on the size of the mob). If you don't get to write any code during your rotation due to discussing/researching, that's fine. You'll soon get another chance to type.

The goal is to learn and have fun. Finishing the challenge is secondary. Enjoy yourselves and take care of eachother!

Challenge: build a key-value in-memory store that has the following characteristics:

* provides a function that given a key returns a value or nil if the key doesn't exist.
* provides a function that given a key and a value stores the value. Returns :ok
* is discoverable without having the PID
* can be stopped.
* can be started with some initial data.
* only allows a single instance running at any given time.
