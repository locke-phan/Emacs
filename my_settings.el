;==== Spaces only indentation =====================================
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;==================================================================

;==== Don't indent if we're in a c++ namespace ====================
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)
;==================================================================

(transient-mark-mode)
(global-auto-revert-mode)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
 
(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'beginning-of-defun)
(global-set-key [(meta down)] 'end-of-defun)

 
;; (setq c-default-style
;;       '((java-mode . "java")

;;         (other . "gnu")))
;; (setq-default c-basic-offset 4)

;; (Global-set-key "\C-M-\\" 'indent-region)
;==== Automatically insert closing braces =========================

;==================================================================
;============================
