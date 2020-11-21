(in-package #:bookmarks-manager)

(djula:add-template-directory (asdf:system-relative-pathname "bookmarks-manager" "template/"))
(defparameter +list.html+ (djula:compile-template* "list.html"))
(defparameter +add_or_edit.html+ (djula:compile-template* "add_or_edit.html"))
(defparameter +search.html+ (djula:compile-template* "search.html"))


(defun index-html ()
  (let* ((bookmarks (get-all-bookmarks))
         (count (length bookmarks)))
    (djula:render-template* +list.html+ nil :bookmarks bookmarks :count count)))

(defun add-html ()
  (djula:render-template* +add_or_edit.html+ nil))

(defun search-html ()
  (djula:render-template* +search.html+ nil))

