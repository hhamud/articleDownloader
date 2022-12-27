(defsystem "article_downloader"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "article_downloader/tests"))))

(defsystem "article_downloader/tests"
  :author ""
  :license ""
  :depends-on ("article_downloader"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for article_downloader"
  :perform (test-op (op c) (symbol-call :rove :run c)))
