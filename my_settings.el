;==== Spaces only indentation =====================================
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default tab-width 4)
;; (custom-set-variables '(tab-width 4))
(setq sgml-basic-offset 4)
(setq-default indent-tabs-mode nil)
;==================================================================

;==== Don't indent if we're in a c++ namespace ====================
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)
;==================================================================

;; Display Mark
(transient-mark-mode)

;; Auto Revert/Update buffer
(global-auto-revert-mode)

;; Comment or uncomment region or line with Meta-;
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
 
(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)
;; (global-set-key "\M-;" )
;; =================================================================

;; Move by defun with meta-up and meta-down
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(defun cm-fast-step-upward ()
  "Step 3 lines up, recenteres the screen."
  (interactive)
  (forward-line -3)
  (recenter))

(defun cm-fast-step-downward ()
  "Step 3 lines down, recenteres the screen."
  (interactive)
  (forward-line 3)
  (recenter))

(global-set-key [(meta up)] 'cm-fast-step-upward)
(global-set-key [(meta down)] 'cm-fast-step-downward)

;; =================================================================

(global-linum-mode 1)
(setq linum-format "%4d\u2503 ")
(show-paren-mode)
(add-to-list 'custom-theme-load-path "~/MySettings/emacs-color-theme-solarized/")
(add-to-list 'load-path "~/MySettings/Emacs/")
(load-theme 'solarized-dark t)

;; (set solarized-contrast "high")
;; (set solarized-visibility "high")
;; (setq c-default-style
;;       '((java-mode . "java")

;;         (other . "gnu")))
;; (setq-default c-basic-offset 4)

;; (Global-set-key "\C-M-\\" 'indent-region)
;==== Automatically insert closing braces =========================

;==================================================================

;==== Groovy/Gradle stuff ====
;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))
;=============================
;==== CMake stuff ====
 (require 'cmake-mode)
 (setq auto-mode-alist
       (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                 ("\\.cmake\\'" . cmake-mode))
               auto-mode-alist))
;============================
