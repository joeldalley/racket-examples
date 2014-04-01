#! /usr/bin/env racket
#lang racket/base

(require racket/string)
(require "../modules/jbd/std-lexer.rkt")

; Sample input text, which we split:
(define text "4ab3c5")

; Print input.
(displayln text)

; Apply standard lexers to input.
(Num text)
(Word text)
