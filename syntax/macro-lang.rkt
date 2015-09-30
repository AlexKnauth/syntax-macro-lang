#lang racket/base

(provide (rename-out [-module-begin #%module-begin]))

(require (for-syntax racket/base
                     syntax/parse
                     racket/syntax
                     ))

(define-syntax -module-begin
  (syntax-parser
    [(module-begin
      current-mod-path:id macro:id #:module-begin base-module-begin:id
      body-stuff:expr ...)
     #:with ooo (quote-syntax ...)
     #:with tmp-module-begin (generate-temporary 'module-begin)
     #'(#%module-begin
        body-stuff ...
        (provide (rename-out [tmp-module-begin #%module-begin]))
        (define-syntax-rule (tmp-module-begin module-body ooo)
          (base-module-begin (macro module-body ooo)))
        (module reader syntax/module-reader current-mod-path))]
    [(module-begin current-mod-path:id macro:id body-stuff:expr ...)
     #'(-module-begin current-mod-path macro body-stuff ...)]))

