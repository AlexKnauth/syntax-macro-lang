syntax-macro-lang [![Build Status](https://travis-ci.org/AlexKnauth/syntax-macro-lang.png?branch=master)](https://travis-ci.org/AlexKnauth/syntax-macro-lang)
===
An experimental racket module language for creating languages, inspired by
[jackfirth/racket-syntax-lang](https://github.com/jackfirth/racket-syntax-lang).

Example language for wrapping the body in the `#%app` macro:
```racket
;; path/to/the-lang.rkt
#lang s-exp syntax/macro-lang path/to/the-lang #%app
(provide #%datum add1)
```
And a file using that language:
```racket
#lang path/to/the-lang
add1 0
```
