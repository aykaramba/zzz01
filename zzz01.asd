(asdf:defsystem #:zzz01
  :description "New CLOG System"
  :author "some@one.com"
  :license  "BSD"
  :version "0.0.0"
  :serial t
  :entry-point "zzz01:start-app"  
  :depends-on (#:clog) ; add clog plugins here as #:plugin for run time
  :components ((:file "zzz01")))

(asdf:defsystem #:zzz01/tools
  :defsystem-depends-on (:clog)
  :depends-on (#:zzz01 #:clog/tools) ; add clog plugins here as #:plugin/tools for design time
  :components ())
