entities
========

`entities` is a simple ANSI C library for decoding
[HTML entities](http://www.w3.org/TR/html4/sgml/entities.html) to UTF-8. It is
testet with both [GCC](http://gcc.gnu.org/) and [clang](http://clang.llvm.org/).

[![Build Status](https://secure.travis-ci.org/ooxi/entities.png)](http://travis-ci.org/ooxi/entities)

It was originally developed by [Christoph Gärtner](https://bitbucket.org/cggaertner/cstuff).


Building entities
-----------------

Since entities uses [CMake](http://www.cmake.org/), building the library is
fairly easy

    $ git clone https://github.com/ooxi/entities.git entities
    $ mkdir entities/build; cd entities/build
    $ cmake -DCMAKE_BUILD_TYPE=Release ..
    $ make && ./test-entities

If you need a debug build, specify `CMAKE_BUILD_TYPE` as `Debug` and rebuild.


License
-------

[Boost Software License, Version 1.0](https://github.com/ooxi/entities/blob/master/LICENSE)

