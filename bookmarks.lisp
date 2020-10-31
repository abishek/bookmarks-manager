(defpackage :bookmarks-manager
  (:use :cl :postmodern))

(in-package #:bookmarks-manager)


;; bookmark consists of a URL, some note attached to the text, some comma separated tags, date added, date updated and an id.
;; for the first cut, each bookmark has an id, URL and date added.
;; we need an hunchentoot route to add a bookmark to the system.

(defun find-all-delims-in-string (csv-string &optional (delim '#\,))
  "returns a list of delimiter locations in string. list is prepended with -1 and append with the length of string."
  (append '(-1) (loop
    with len = (length csv-string)
    for ch across csv-string
    for idx from 0 to len
    if (char= ch delim) collect idx) (list (length csv-string))))

(defun construct-position-tuples (poslist)
  "returns a list of tuples indicating string extents."
  (loop
    for idx from 0 to (length poslist)
    if (< idx (1- (length poslist)))
      collect (cons  (nth idx poslist) (nth (1+ idx) poslist))))

(defun convert-to-tags (csv-string)
  "Converts a CSV String into a list of tags"
  (loop
    for tuple in (construct-position-tuples (find-all-delims-in-string csv-string))
    collect (string-trim '(#\Space) (subseq csv-string (1+ (car tuple)) (cdr tuple)))))

  
