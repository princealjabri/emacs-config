
;; If you want to use latest versio
;; If you want to use last tagged version
;; Add MELPA

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
      '("MELPA" . "https://melpa.org/packages/") t))
(package-initialize)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414/dict")
(ac-config-default)
;;auto complete
;;(require 'auto-complete)
(global-auto-complete-mode t)

;;theme1
(load-theme 'dracula t)
;;(load-theme 'flatui-dark t)
;;theme2
;;cursor


;;commenting
(setq-default fill-column 80)
;;speed type
;;(require 'speed-type)

;;magit
;;(require 'magit)
;;(global-set-key (kbd "C-x g") 'magit-status)

;;line numbers
(setq column-number-mode t)

;;kill
(global-set-key (kbd "M-9") 'kill-whole-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
          (add-hook 'caml-mode-hook 'merlin-mode t)))  
