(global-set-key "\M-g" 'goto-line) 

;;php-mode
    (load-library "php-mode")
    (require 'php-mode)

;;scala-mode
    (add-to-list 'load-path' "/Users/user/bin/scala-2.7.7.final/misc/scala-tool-support/emacs/")
    (require 'scala-mode-auto)
    (setq scala-interpreter "/Users/user/bin/scala-2.7.7.final/bin/scala")

;;yaml-mode
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
    (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
    (load-library "yaml-mode")
    (require 'yaml-mode)

;;ruby-mode
    (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
    (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
    (load-library "ruby-mode")
    (require 'ruby-mode)

(setq-default c-basic-offset 4)

(when (load "js2" t)
  (setq js2-cleanup-whitespace nil
        js2-mirror-mode nil
        js2-bounce-indent-flag nil)

  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))
  (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

  (define-key js2-mode-map "\C-m" nil)

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))
