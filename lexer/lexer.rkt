#! /usr/bin/env racket
#lang racket/base

; Driver for jbd/* modules.
; Author:  Joel Dalley
; Version: 2014/Apr/02

(require racket/block)
(require racket/string)
(require "../modules/jbd/std-lexer.rkt")

(define lexers (list Num Word Op))

(define text "1 2 4 8")

(define (tokenize text)
  (if (= (string-length text) 0)
    '()
    (block 
      (define res (Num text))
      (displayln res))))

(tokenize text)
