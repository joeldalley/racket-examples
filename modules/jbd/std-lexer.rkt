#lang racket

; Module:  jbd/std-lexer.rkt
; Author:  Joel Dalley
; Version: 2014/Apr/01

(require racket/string)

; Export symbols.
(provide Num Word Op)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Lexers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (Num text)
  (match-to-pair text (regexp-match #px"^\\d+" text)))

(define (Word text)
  (match-to-pair text (regexp-match #px"^\\w+" text)))

(define (Op text)
  (match-to-pair text (regexp-match #px"^[\\+\\-\\*\\/]" text)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utilities ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Return matched text + remaining text, or the empty list.
(define (match-to-pair text match)
  (cond 
    [(pair? match) (list (car match) 
                         (substring text (string-length
                                         (car match))))]
    [(false? match) '()]))


