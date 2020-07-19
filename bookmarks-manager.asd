(in-package #:cl-user)
(asdf:defsystem #:bookmarks-manager
  :defsystem-depends-on (:radiance)
  :class "radiance:virtual-module"
  :components ((:file "module")
               (:file "frontend"))
  :depends-on ((:interface :database)
               (:interface :logger)
               :r-data-model
               :r-clip))
