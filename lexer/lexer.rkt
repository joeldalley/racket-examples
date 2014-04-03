#! /usr/bin/env racket
#lang racket/base

; Driver for jbd/* modules.
; Author:  Joel Dalley
; Version: 2014/Apr/02

(require racket/block)
(require racket/string)
(require "../modules/jbd/std-lexer.rkt")

(define lexers (list Num Word Space Op))

(define text "1 2 4 8")

(define (create-token type value) (list type value)) 
(define (token-type token) (car token))
(define (token-value token) (cdr token))

(define (tokenize text tokens)
  (for-each (lambda (lexer)
    (define res (lexer text))
    (if (null? res)
      tokens
      (block
        (define token (create-token (caddr res) (car res)))
        (displayln (cons token tokens))
        (tokenize (cadr res) (cons token tokens)))))
    lexers))

(tokenize text '())
