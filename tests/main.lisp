(defpackage article_downloader/tests/main
  (:use :cl
        :article_downloader
        :rove))
(in-package :article_downloader/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :article_downloader)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
