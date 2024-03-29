(in-package #:cl-user)

(defpackage #:system-naming
  (:use #:cl #:asdf))

(in-package #:system-naming)

(defsystem #:naming
  :author "Liutos <mat.liutos@gmail.com>"
  :version "0.1.0"
  :depends-on (#:alexandria
               #:cl-dbi
               #:cl-ppcre
               #:clack
               #:jonathan
               #:ningle
               #:ruyi
               #:str
               #:uiop)
  :components
  ((:module "src"
            :components
            ((:module "app"
                      :components
                      ((:module "entity"
                                :components
                                ((:file "idiom")
                                 (:file "letter")
                                 (:file "poetry")))
                       (:module "use_case"
                                :components
                                ((:file "add_idiom")
                                 (:file "add_letter")
                                 (:file "add_poetry")
                                 (:file "find_idiom_by_letter")
                                 (:file "find_letter")
                                 (:file "find_letter_group")
                                 (:file "find_letter_unique_pinyin"))
                                :depends-on ("entity"))))
             (:module "helper"
                      :components
                      ((:file "repository_factory"))
                      :depends-on ("infra" "repository"))
             (:module "infra"
                      :components
                      ((:file "db_connection"))
                      :depends-on ("repository"))
             (:module "lib"
                      :components
                      ((:file "sql_builder")))
             (:module "repository"
                      :components
                      ((:file "connection_interface")
                       (:file "idiom"
                              :depends-on ("connection_interface"))
                       (:file "letter"
                              :depends-on ("connection_interface"))
                       (:file "poetry"
                              :depends-on ("connection_interface")))
                      :depends-on ("lib"))
             (:module "web"
                      :components
                      ((:file "app")
                       (:module "controller"
                                :components
                                ((:file "add_letter")
                                 (:file "find_idiom_by_letter")
                                 (:file "find_letter")
                                 (:file "find_letter_group"))
                                :depends-on ("app"))))))))
