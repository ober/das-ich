;;; das-ich.el --- Run Go-lang code in Elisp.

;;; -*- lexical-binding: t -*-

;; Copyright (C) 2013  Jaime Fournier <jaimef@linbsd.org>

;; Author: Jaime Fournier <jaimef@linbsd.org>
;; Keywords: Go-lang Go
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Why?
;; The question is How. The question is ALWAYS how. -"Kevin Mitnick, TakeDown"


;;; Code:

;; Example Functions that handle calls to rest endpoints can be found in examples.el
(defun go-run (code args)
  (let ((tmpfile (format "/tmp/gr.%s.%s.go" (random 1000) (random 1000))))
    (with-temp-file tmpfile (insert code))
    (start-process
     "gorun"
     "gorun"
     "go"
     "run"
     (format "%s" tmpfile)
     (format "%s" args))))

(setq codey "
package main

import (
\"fmt\"
)

func fibonacci(n int) int {
     var result int
     if n < 2 {
       result = 1
     } else {
      result = fibonacci(n-2) + fibonacci(n-1)
     }
     return result
}

func main() {
    fmt.Println(\"Fib: \", fibonacci(4000))
}
")


(go-run codey "")

(provide 'dasich)
