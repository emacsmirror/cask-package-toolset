;; test helper inspired from https://github.com/tonini/overseer.el/blob/master/test/test-helper.el

;;; Code:

(require 'f)

(defvar cpt-path
  (f-parent (f-this-file)))

(defvar cpt-test-path
  (f-dirname (f-this-file)))

(defvar cpt-root-path
  (f-parent cpt-test-path))

(defvar cpt-sandbox-path
  (f-expand "sandbox" cpt-test-path))

(defmacro within-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(let ((default-directory cpt-sandbox-path))
     (f-mkdir default-directory)
     ,@body
     (f-delete default-directory :force)))

(require 'ert)
(require 's)
(require 'cask-package-toolset (f-expand "cask-package-toolset" cpt-root-path))

(provide 'test-helper)

;;; test-helper.el ends here