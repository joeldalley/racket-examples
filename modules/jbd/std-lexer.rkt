#lang racket

; Module:  jbd/std-lexer.rkt
; Author:  Joel Dalley
; Version: 2014/Apr/01

(require racket/string)

; Export symbols.
(provide Num Word Op Space)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Lexers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (Num text)
  (define r #px"^\\d+")
  (match-to-tuple "Num" text (regexp-match r text)))

(define (Word text)
  (define r #px"^\\w+")
  (match-to-tuple "Word" text (regexp-match r text)))

(define (Space text)
  (define r #px"^\\s+")
  (match-to-tuple "Space" text (regexp-match r text)))

(define (Op text)
  (define r #px"^[\\+\\-\\*\\/]")
  (match-to-tuple "Op" text (regexp-match r text)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utilities ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (match-to-list type text match)
  (list (car match)
        (substring text (string-length (car match)))
        type))

(define (match-to-tuple type text match)
  (cond [(list? match) (match-to-list type text match)]
        [(false? match) '()]))


