#lang racket

; Module: std-lexer.
; Author: Joel Dalley
; Version: 2014/Apr/01

(require racket/string)

(provide Num Word)

(define (match-to-pair text match)
  (cond 
    [(pair? match) (list (car match) 
                         (substring text (string-length (car match))))]
    [(false? match) (list "" text)]))


(define (Num text)
  (match-to-pair text (regexp-match #px"^\\d+" text)))

(define (Word text)
  (match-to-pair text (regexp-match #px"^\\w+" text)))
