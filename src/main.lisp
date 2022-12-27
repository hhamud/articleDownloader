(defpackage article_downloader
  (:use :cl))
(in-package :article_downloader)

;; Packages
(ql:quickload :dexador)
(ql:quickload :cl-dotenv)
(ql:quickload :cl-json)


;; parameters
(defvar *consumer-token* "")
(defvar *code-token* "")
(defvar *auth-token* "")

;; Functions
(defun read-env ()
  (let ((api_key
         (progn
           (.env:load-env (asdf:system-relative-pathname "article_downloader" "./.env"))
           (uiop:getenv "CONSUMER_KEY"))))
  (setq *consumer-token* api_key)))

(defun get-code-token ()
  (if (string= *consumer-token* "")
      (read-env)
  (let* ((*json-resp*
    (dex:post "https://getpocket.com/v3/oauth/request"
     :headers '(("Content-Type" . "application/json") ("X-Accept" . "application/json"))
     :content (cl-json:encode-json-to-string `(("redirect_uri" . "http://www.google.com") ("consumer_key" . ,*consumer-token*))
     :verbose t))
    (*list-resp*
      (cl-json:decode-json-from-string *json-resp*))
         (*data* (cdr (assoc :code *list-resp*))))
    (setq *code-token* *data*))))

(defun get-auth-token ()
  (let* ((*json-resp*
           (dex:post "https://getpocket.com/v3/oauth/authorize"
                     :headers '(("Content-Type" . "application/json") ("X-Accept" . "application/json"))
                     :content (cl-json:encode-json-to-string `(("consumer_key" . ,*consumer-token*) ("code" . ,*code_token*)))))
           (*list-resp*
                (cl-json:decode-json-from-string *json-resp*))
           (*data* (cdr (assoc :access_token *list-resp*))))
    (setq *auth-token* *data*))
  )

(defun auth ()
      (get-code-token)
      (get-auth-token))


  ;;(if (string= *code-token* "")
      ;;(progn
      ;;(get-code-token)
      ;;(get-auth-token))
      ;;(get-auth-token))
  ;;)
(defun fetch-article-list)
(defun convert-article-markdow
  n)
;; blah blah blah.
