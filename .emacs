;;install melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" .  "http://melpa.milkbox.net/packages/")
   t)
  (package-initialize))

;;OSX下的环境变量
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;禁用下划线转义
(setq-default org-use-sub-superscripts nil)

;;当前行高亮
(global-hl-line-mode 1)

;;theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/emacs-color-theme-solarized/")
(load-theme 'leuven t)

;;smex
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;company mode set M tab as company-complete
(add-hook 'after-init-hook 'global-company-mode)
(define-key global-map  [(M tab)] 'company-complete)
(define-key global-map  [(M tab)] 'company-complete)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;smartparens-global-mode
(require 'smartparens)
(smartparens-global-mode 1)

;;GO settings start
;;设置GO相关环境变量
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(exec-path-from-shell-copy-env "GOPATH")
(setenv "GOBIN" (concat (getenv "GOPATH") "/bin"))
(add-to-list 'exec-path (getenv "GOBIN"))
;;set gofmt
(add-hook 'before-save-hook 'gofmt-before-save)
;;set flycheck
(global-flycheck-mode)

(require 'company)                     
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq company-tooltip-limit 60)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;;GO settings end

;;自动生成BY Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "9d08af845e2761d07c9312629a31c126fb29b6f570f974d3c283a8146fb9e284" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
