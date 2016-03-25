;;install melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;禁用下划线转义
(setq-default org-use-sub-superscripts nil)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; 将ECB 的路径添加到读取列表中
(add-to-list 'load-path "~/.emacs.d/ecb-master/")

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)




(require 'cedet)
(require 'ecb)
(require 'xcscope)
(require 'fill-column-indicator)


(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized-master")
(load-theme 'tango-dark t)


(add-to-list 'load-path "~/.emacs.d/elpa/company-0.8.12/")
(autoload 'company-mode "company" nil t)

(define-key global-map [(C f3)] 'cscope-find-functions-calling-this-function)
(define-key global-map [(control f4)] 'cscope-find-this-file)
(define-key global-map [(control f5)] 'cscope-find-this-symbol)
(define-key global-map [(control f6)] 'cscope-find-this-text-string)
(define-key global-map [(control f7)] 'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)] 'cscope-pop-mark)
(define-key global-map [(control f9)] 'cscope-prev-symbol)
(define-key global-map [(control f10)] 'cscope-next-symbol)

;;company mode
(add-hook 'after-init-hook 'global-company-mode)
(define-key global-map  [(M tab)] 'company-complete)
(define-key global-map  [(M tab)] 'company-complete)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)
