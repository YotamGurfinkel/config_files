;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Yotam Gurfinkel"
      user-mail-address "yotam706@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-font (font-spec :family "Iosevka" :size 16 :weight 'semi-bold))
(setq doom-theme 'doom-one)
;; (add-hook 'python-mode-hook 'jedi:setup)
(add-hook! 'terraform-mode-hook '(terraform-format-on-save-mode))

;;(defun my/sql-mode-hook ()
;;  (setq-local company-backends '(company-dabbrev-code))
;;  )

;;(setq +lsp-company-backends '(:separate company-capf :with company-yasnippet company-dabbrev-code))
;;(set-company-backend! 'sql-mode '(company-dabbrev-code))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Dont comment new lines
(setq comment-line-break-function nil)
(setq +evil-want-o/O-to-continue-comments nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-set-key (kbd "C->") #'mc/mark-next-like-this)
(global-set-key (kbd "C-<") #'mc/mark-previous-like-this)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank))

(defun rc/add-semicolon ()
  "Add Semicolon at End of Line"
  (interactive)
  (move-end-of-line 1)
  (insert ";"))

;; (global-set-key (kbd "C-M-;") 'rc/add-semicolon)
(map! "C-M-;" #'rc/add-semicolon)
(map! "C-," #'rc/duplicate-line)


(global-set-key (kbd "C-{") 'evil-shift-left-line)
(global-set-key (kbd "C-}") 'evil-shift-right-line)
(define-key evil-insert-state-map (kbd "C-M-{") 'evil-shift-left)
(define-key evil-insert-state-map (kbd "C-M-}") 'evil-shift-right)

;; (add-hook! c++-mode-hook 'irony-mode)
;; (add-hook! c-mode-hook 'irony-mode)
;; (add-hook! objc-mode-hook 'irony-mode)

;; (add-hook! irony-mode-hook 'irony-cdb-autosetup-compile-options)
(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)))
(defun insert-line-above ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1)))

(global-set-key (kbd "<M-return>") 'insert-line-below)
;; (global-set-key (kbd "C-j") 'insert-line-above)
;; Maybe for bypassing doom emacs
(define-key evil-insert-state-map (kbd "C--") 'text-scale-decrease)
(define-key evil-insert-state-map (kbd "C-=") 'text-scale-increase)
(define-key evil-insert-state-map (kbd "C-y") 'yank)
;; (define-key evil-insert-state-map (kbd "C-j") 'insert-line-above)
;; (define-key evil-insert-state-map (kbd "C-M-;") 'rc/add-semicolon)

(use-package! dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;; (setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.config/doom/doom-emacs-dash.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
			            (bookmarks . "book"))))

;; (use-package! lsp-java :config (add-hook 'java-mode-hook 'lsp))

;; Add keybindings for interacting with Cargo
                                        ;(use-package cargo
                                        ;  :hook (rust-mode . cargo-minor-mode))

;;(use-package! flycheck-rust
;;  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
;;

;; (use-package! company
;;   :init
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 1)
;;   )
(use-package corfu
  :config
  (setq corfu-cycle t
        corfu-auto t
        corfu-auto-prefix 1
        corfu-auto-delay 0
        corfu-separator ?\s
        corfu-quit-at-boundary 'separator
        corfu-quit-no-match t
        corfu-preview-current nil
        corfu-preselect-first t
        corfu-on-exact-match nil
        corfu-echo-documentation t
        corfu-scroll-margin 10)
  (map! :map corfu-map
        "C-j" #'corfu-next
        "C-k" #'corfu-previous
        "C-;" #'corfu-doc-toggle
        "TAB" #'corfu-insert
        "<tab>" #'corfu-insert
        "ESC" #'corfu-reset)

  (add-hook! '(prog-mode-hook
               text-mode-hook)
    (corfu-mode +1)))


;; Disable keymaps conflicting with corfu that I don't use anyways
(define-key global-map (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key global-map (kbd "C-k") nil)

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package lsp-mode
  ;; :init
  ;; (defun my/lsp-mode-setup-completion ()
  ;;   (setq-local completion-styles '(flex)))
  :commands
  (lsp lsp-deferred)
  :init
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(partial-completion))) ;; Configure flex
  :config
  ;; We use Corfu!
  (setq lsp-completion-provider :none)
  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))
;; (add-hook 'lsp-completion-mode-hook #'my/lsp-mode-setup-completion))
;; (add-hook 'lsp-mode-hook (lambda () (lsp-completion-mode +1))))

(use-package! lsp-pyright
  :hook (python-mode . (lambda () (lsp-deferred)))
  )

;; Add extensions
(use-package cape
  :hook ((lsp-completion-mode . kb/cape-capf-setup-lsp))
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
  (add-to-list 'completion-at-point-functions (cape-company-to-capf #'company-yasnippet))

  (defun kb/cape-capf-setup-lsp ()
    (setq-local completion-at-point-functions
                (list (cape-super-capf (cape-capf-buster #'lsp-completion-at-point) (cape-company-to-capf #'company-yasnippet))))
    ;; (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point)))
    ;; (add-to-list 'completion-at-point-functions (cape-company-to-capf #'company-yasnippet))
    ;; (add-to-list 'completion-at-point-functions #'cape-file)
    ;; (add-to-list 'completion-at-point-functions #'cape-tex)
    ;; (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
    ;; (add-to-list 'completion-at-point-functions #'cape-keyword)
    ;; (add-to-list 'completion-at-point-functions #'cape-symbol)
    )
  )

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq vterm-shell "/usr/bin/fish"
      vterm-max-scrollback 5000)

;; (after! lsp-mode
;;   (setq lsp-enable-symbol-highlighting nil)
;;   (setq lsp-enable-on-type-formatting nil)
;;   (setq lsp-signature-auto-activate nil)
;;   (setq lsp-modeline-code-actions-enable nil)
;;   (setq lsp-enable-folding nil)
;;   (setq lsp-ui-sideline-show-code-actions nil)
;;   (setq lsp-enable-snippet nil))

(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-server 'rust-analyzer)

;; I rarely use it, but lets open PDFs in emacs!
;; (pdf-loader-install)
