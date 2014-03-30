#! /usr/bin/env racket
#lang racket/base

; For regexp-match-positions
(require racket/string)

; Sample input text, which we split on spaces:
(define text "This is input text. 1 1 2 3 5 8 13")
(define words (string-split text #px"\\s+"))

; Print input.
(displayln words)

; Trivial lexer distinguishes wordish texts from numberish texts.
(define (lex chars)
  (cond 
    [(regexp-match-positions #px"\\d+" chars) (cons "Number" chars)]
    [(regexp-match-positions #px"\\w+" chars) (cons "Word" chars)]   ))

; Print output.
(map displayln (map lex words))
