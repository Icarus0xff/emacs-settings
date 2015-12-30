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
(load-theme 'solarized t)


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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.17326732673267325 . 0.28846153846153844) (ecb-sources-buffer-name 0.17326732673267325 . 0.23076923076923078) (ecb-methods-buffer-name 0.17326732673267325 . 0.28846153846153844) (ecb-history-buffer-name 0.17326732673267325 . 0.17307692307692307)))))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

