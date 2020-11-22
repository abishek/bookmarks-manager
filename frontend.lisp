(in-package #:bookmarks-manager)

(djula:add-template-directory (asdf:system-relative-pathname "bookmarks-manager" "template/"))
(defparameter +list.html+ (djula:compile-template* "list.html"))
(defparameter +add_or_edit.html+ (djula:compile-template* "add_or_edit.html"))
(defparameter +search.html+ (djula:compile-template* "search.html"))


(defun list-bookmarks ()
  (let* ((bookmarks (get-all-bookmarks))
         (count (length bookmarks)))
    (djula:render-template* +list.html+ nil :bookmarks bookmarks :count count)))

(defun new-bookmark ()
  (djula:render-template* +add_or_edit.html+ nil))

(defun edit-bookmark (bookmark)
  (djula:render-template* +add_or_edit.html+ nil :bookmark bookmark))

(defun search-html (&optional results search-term)
  (let ((count (length results)))
    (djula:render-template* +search.html+ nil :bookmarks results :count count :search search-term)))

