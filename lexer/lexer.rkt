#! /usr/bin/env racket
#lang racket/base

; Driver for jbd/std-lexer.rkt.
; Author:  Joel Dalley
; Version: 2014/Apr/02

(require racket/block)
(require racket/string)
(require "../modules/jbd/std-lexer.rkt")

; Turns input text into a (type, remaining-text, value) triplet.
(define (lex text)
  (cond [(not (null? (Num text)))   (Num text)]
        [(not (null? (Word text)))  (Word text)]
        [(not (null? (Op text)))    (Op text)]
        [(not (null? (Space text))) (Space text)]
        [(= 1 1) (list "DUMMY" 
                       (if (> (string-length text) 0)
                           (substring text 1) "") 
                       "UNDEF")]))

; Turns input text into a list of (type, value) pairs.
(define (tokenize text tokens)
  (define lexed (lex text))
  (define text-left? (> (string-length (cadr lexed)) 0))
  (define token (list (caddr lexed) (car lexed)))
  (define new-tokens (cons token tokens))
  (if text-left? (tokenize (cadr lexed) new-tokens) new-tokens))


; Tokenize input text.
(define input-text "1 Foobar 4+9 Foo2")
(define token-list (reverse (tokenize input-text '())))

; Print.
(displayln (string-join (list "Input Text: " input-text "\n")))
(for-each (lambda (T) (displayln T)) token-list)
