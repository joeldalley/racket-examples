#! /usr/bin/env racket
#lang racket/base

; For regexp-match-positions
(require racket/string)

; Sample input text, which we split on spaces:
(define text "This is input text . 1 + 1 - 2 / 3 * 5 % 8 ^ 13")
(define words (string-split text #px"\\s+"))

; Print input.
(displayln text)

; Trivial lexer.
(define (lex chars)
  (cond 
    [(regexp-match-positions #px"\\d+" chars) 
      (cons "Num" chars)]
    [(regexp-match-positions #px"\\w+" chars) 
      (cons "Word" chars)]
    [(regexp-match-positions #rx"[\\{\\}\\(\\)\\+-\\*/\\.%^]" chars) 
     (cons "Op" chars)]
    [(= 1 1) (cons "Void" "UNDEF")]))

; Token string representation.
(define (stringify p)
  (string-join (list (car p) 
                     (string-join (list "[" (cdr p) "]"))) ""))

; Print output.
(displayln (map stringify (map lex words)))
