;; -*- coding: utf-8 -*-

;; a vi-like modal keybinding for emacs.
;; created: 2013-09-10
;; Xah Lee

;; home page
;; http://ergoemacs.org/misc/ergoemacs_vi_mode.html

;;; INSTALL

;; put the xah-fly-keys directory in ~/.emacs.d/lisp/

;; put the following in your emacs init at ~/.emacs.d/init.el

;; (add-to-list 'load-path "~/.emacs.d/lisp/xah-fly-keys/")
;; (require 'xah-fly-keys)

;;; LICENSE
;; buy my tutorial http://ergoemacs.org/emacs/buy_xah_emacs_tutorial.html

;;; TODO
;; • make it a proper minor mode.
;; • make it support diff Keyboard layouts
;; • fine-tune keys in command mode. (introduce key sequence there. Consider whether {open, close, save} should be there. and some other commands such as {dired-jump, query-replace-regexp, xah-toggle-letter-case}.)

(require 'dired) ; in emacs
(require 'dired-x) ; in emacs
(provide 'xah-replace-pairs)
(require 'xeu_elisp_util)



(global-set-key (kbd "<home>") 'xfk-command-mode-activate)

(defvar xfk-major-mode-lead-key nil "Lead key for all major mode's key sequence. By default, it's (kbd \"<menu> e\"). Only supported by xah's modes.")
(setq xfk-major-mode-lead-key (kbd "<menu> e"))

(defvar xfk-use-xah-keys-p nil "If true, use xah lee's personal keys, that may not be suitable for other keyboard or workflow.")
(setq xfk-use-xah-keys-p t)



(defun xah-get-fullpath (φfile-relative-path)
  "Return the full path of ΦFILE-RELATIVE-PATH, relative to caller's file location.

Example: If you have this line
 (xah-get-fullpath \"../xyz.el\")
in the file at
 /home/mary/emacs/emacs_lib.el
then the return value is
 /home/mary/xyz.el
Regardless how or where emacs_lib.el is called.

This function solves 2 problems.

① If you have file A, that calls the `load' on a file at B, and B calls `load' on file C using a relative path, then Emacs will complain about unable to find C. Because, emacs does not switch current directory with `load'.

To solve this problem, when your code only knows the relative path of another file C, you can use the variable `load-file-name' to get the current file's full path, then use that with the relative path to get a full path of the file you are interested.

② To know the current file's full path, emacs has 2 ways: `load-file-name' and `buffer-file-name'. If the file is loaded by `load', then `load-file-name' works but `buffer-file-name' doesn't. If the file is called by `eval-buffer', then `load-file-name' is nil. You want to be able to get the current file's full path regardless the file is run by `load' or interactively by `eval-buffer'."

  (concat (file-name-directory (or load-file-name buffer-file-name)) φfile-relative-path)
)

(load (xah-get-fullpath "xah-fly-keys-cursor-movement"))
(load (xah-get-fullpath "xah-fly-keys-editing-commands"))
(load (xah-get-fullpath "xah-fly-keys-text-selection"))
(load (xah-get-fullpath "xah-fly-keys-insert-commands"))
(load (xah-get-fullpath "xah-fly-keys-replace-commands"))
(load (xah-get-fullpath "xah-fly-keys-dired-commands"))
(load (xah-get-fullpath "xah-fly-keys-misc-commands"))
(load (xah-get-fullpath "xah-fly-keys-misc-commands2"))
(load (xah-get-fullpath "xah-fly-keys-mouse-commands"))
(load (xah-get-fullpath "xah-fly-keys-insertion-keymap"))

(load (xah-get-fullpath "xah-fly-keys-control-key"))
(load (xah-get-fullpath "xah-fly-keys-meta-key"))
(load (xah-get-fullpath "xah-fly-keys-special-keys"))
(load (xah-get-fullpath "xah-fly-keys-mode-specific"))
(load (xah-get-fullpath "xah-fly-keys-user-keymap"))
(load (xah-get-fullpath "xah-fly-keys-emacs-1k-keymap"))
(load (xah-get-fullpath "xah-fly-keys-mouse-binding"))
(load (xah-get-fullpath "xah-fly-keys-global-set-keys"))



(defvar xfk-insert-state-q t "Boolean value. true means insertion mode is on.")
(setq xfk-insert-state-q t)

(defun xfk-insert-mode-init ()
  "set insertion mode keys"
  (interactive)
  ;; TODO use a proper keymap
  (progn

    (global-set-key (kbd "'") 'self-insert-command)
    (global-set-key (kbd ",") 'self-insert-command)
    (global-set-key (kbd "-") 'self-insert-command)
    (global-set-key (kbd ".") 'self-insert-command)
    (global-set-key (kbd "/") 'self-insert-command)
    (global-set-key (kbd ";") 'self-insert-command)
    (global-set-key (kbd "=") 'self-insert-command)
    (global-set-key (kbd "[") 'self-insert-command)
    (global-set-key (kbd "\\") 'self-insert-command)
    (global-set-key (kbd "]") 'self-insert-command)
    (global-set-key (kbd "`") 'self-insert-command)
    (global-set-key (kbd "SPC") 'self-insert-command)

    (global-set-key (kbd "1") 'self-insert-command)
    (global-set-key (kbd "2") 'self-insert-command)
    (global-set-key (kbd "3") 'self-insert-command)
    (global-set-key (kbd "4") 'self-insert-command)
    (global-set-key (kbd "5") 'self-insert-command)
    (global-set-key (kbd "6") 'self-insert-command)
    (global-set-key (kbd "7") 'self-insert-command)
    (global-set-key (kbd "8") 'self-insert-command)
    (global-set-key (kbd "9") 'self-insert-command)
    (global-set-key (kbd "0") 'self-insert-command)

    (global-set-key (kbd "a") 'self-insert-command)
    (global-set-key (kbd "b") 'self-insert-command)
    (global-set-key (kbd "c") 'self-insert-command)
    (global-set-key (kbd "d") 'self-insert-command)
    (global-set-key (kbd "e") 'self-insert-command)
    (global-set-key (kbd "f") 'self-insert-command)
    (global-set-key (kbd "g") 'self-insert-command)
    (global-set-key (kbd "h") 'self-insert-command)
    (global-set-key (kbd "i") 'self-insert-command)
    (global-set-key (kbd "j") 'self-insert-command)
    (global-set-key (kbd "k") 'self-insert-command)
    (global-set-key (kbd "l") 'self-insert-command)
    (global-set-key (kbd "m") 'self-insert-command)
    (global-set-key (kbd "n") 'self-insert-command)
    (global-set-key (kbd "o") 'self-insert-command)
    (global-set-key (kbd "p") 'self-insert-command)
    (global-set-key (kbd "q") 'self-insert-command)
    (global-set-key (kbd "r") 'self-insert-command)
    (global-set-key (kbd "s") 'self-insert-command)
    (global-set-key (kbd "t") 'self-insert-command)
    (global-set-key (kbd "u") 'self-insert-command)
    (global-set-key (kbd "v") 'self-insert-command)
    (global-set-key (kbd "w") 'self-insert-command)
    (global-set-key (kbd "x") 'self-insert-command)
    (global-set-key (kbd "y") 'self-insert-command)
    (global-set-key (kbd "z") 'self-insert-command)

    (global-set-key (kbd "A") 'self-insert-command)
    (global-set-key (kbd "B") 'self-insert-command)
    (global-set-key (kbd "C") 'self-insert-command)
    (global-set-key (kbd "D") 'self-insert-command)
    (global-set-key (kbd "E") 'self-insert-command)
    (global-set-key (kbd "F") 'self-insert-command)
    (global-set-key (kbd "G") 'self-insert-command)
    (global-set-key (kbd "H") 'self-insert-command)
    (global-set-key (kbd "I") 'self-insert-command)
    (global-set-key (kbd "J") 'self-insert-command)
    (global-set-key (kbd "K") 'self-insert-command)
    (global-set-key (kbd "L") 'self-insert-command)
    (global-set-key (kbd "M") 'self-insert-command)
    (global-set-key (kbd "N") 'self-insert-command)
    (global-set-key (kbd "O") 'self-insert-command)
    (global-set-key (kbd "P") 'self-insert-command)
    (global-set-key (kbd "Q") 'self-insert-command)
    (global-set-key (kbd "R") 'self-insert-command)
    (global-set-key (kbd "S") 'self-insert-command)
    (global-set-key (kbd "T") 'self-insert-command)
    (global-set-key (kbd "U") 'self-insert-command)
    (global-set-key (kbd "V") 'self-insert-command)
    (global-set-key (kbd "W") 'self-insert-command)
    (global-set-key (kbd "X") 'self-insert-command)
    (global-set-key (kbd "Y") 'self-insert-command)
    (global-set-key (kbd "Z") 'self-insert-command)
))

(defun xfk-command-mode-init ()
  "set command mode keys"
  (interactive)
  (progn

    (global-set-key (kbd "'") 'xah-compact-uncompact-block)
    (global-set-key (kbd ",") 'xah-shrink-whitespaces)
    (global-set-key (kbd "-") nil)
    (global-set-key (kbd ".") 'backward-kill-word)
    (global-set-key (kbd ";") nil)
    (global-set-key (kbd "/") 'xah-backward-equal-sign)
    (global-set-key (kbd "\\") nil)
    (global-set-key (kbd "=") 'xah-forward-equal-sign)
    (global-set-key (kbd "[") 'xah-backward-quote )
    (global-set-key (kbd "]") 'xah-forward-quote)
    (global-set-key (kbd "`") nil)
    (global-set-key (kbd "SPC") 'xfk-insert-mode-activate)

    ;; note:
    ;; keys 1 and 8 are swapped
    ;; keys 2 and 7 are swapped
    (global-set-key (kbd "8") 'xfk-insert-mode-activate)
    (global-set-key (kbd "7") 'delete-window)
    (global-set-key (kbd "3") 'delete-other-windows)
    (global-set-key (kbd "4") 'split-window-vertically)
    (global-set-key (kbd "5") 'redo)

    (global-set-key (kbd "6") 'xah-select-current-block)
    (global-set-key (kbd "2") 'xah-select-current-line)
    (global-set-key (kbd "1") 'xah-extend-selection)
    (global-set-key (kbd "9") 'xah-select-text-in-quote)
    (global-set-key (kbd "0") 'xah-backward-punct)

    (global-set-key (kbd "a") 'open-line)
    (global-set-key (kbd "b") 'save-buffer)
    (global-set-key (kbd "c") 'previous-line)
    (global-set-key (kbd "d") 'xah-beginning-of-line-or-block)
    (global-set-key (kbd "e") 'delete-backward-char)
    (global-set-key (kbd "f") 'undo)
    (global-set-key (kbd "g") 'backward-word)
    (global-set-key (kbd "h") 'backward-char)
    (global-set-key (kbd "i") 'kill-line)
    (global-set-key (kbd "j") 'xah-cut-line-or-region)
    (global-set-key (kbd "k") 'yank)
    (global-set-key (kbd "l") 'xah-forward-punct)
    (global-set-key (kbd "m") 'xah-backward-left-bracket)
    (global-set-key (kbd "n") 'forward-char)
    (global-set-key (kbd "o") 'xah-insert-space-after)
    (global-set-key (kbd "p") 'kill-word)
    (global-set-key (kbd "q") 'xah-copy-line-or-region)
    (global-set-key (kbd "r") 'forward-word)
    (global-set-key (kbd "s") 'xah-end-of-line-or-block)
    (global-set-key (kbd "t") 'next-line)
    (global-set-key (kbd "u") 'delete-char)
    (global-set-key (kbd "v") 'xah-forward-right-bracket)
    (global-set-key (kbd "w") 'other-window)
    (global-set-key (kbd "x") nil)
    (global-set-key (kbd "y") 'set-mark-command)
    (global-set-key (kbd "z") 'comment-dwim)

    (global-set-key (kbd "A") 'self-insert-command)
    (global-set-key (kbd "B") 'self-insert-command)
    (global-set-key (kbd "C") 'xah-cycle-hyphen-underscore-space)
    (global-set-key (kbd "D") 'self-insert-command)
    (global-set-key (kbd "E") 'self-insert-command)
    (global-set-key (kbd "F") 'self-insert-command)
    (global-set-key (kbd "G") 'xah-cycle-camel-style-case)
    (global-set-key (kbd "H") 'self-insert-command)
    (global-set-key (kbd "I") 'self-insert-command)
    (global-set-key (kbd "J") 'self-insert-command)
    (global-set-key (kbd "K") 'self-insert-command)
    (global-set-key (kbd "L") 'self-insert-command)
    (global-set-key (kbd "M") 'self-insert-command)
    (global-set-key (kbd "N") 'self-insert-command)
    (global-set-key (kbd "O") 'self-insert-command)
    (global-set-key (kbd "P") 'self-insert-command)
    (global-set-key (kbd "Q") 'self-insert-command)
    (global-set-key (kbd "R") 'hippie-expand)
    (global-set-key (kbd "S") 'self-insert-command)
    (global-set-key (kbd "T") 'xah-toggle-letter-case)
    (global-set-key (kbd "U") 'self-insert-command)
    (global-set-key (kbd "V") 'self-insert-command)
    (global-set-key (kbd "W") 'self-insert-command)
    (global-set-key (kbd "X") 'self-insert-command)
    (global-set-key (kbd "Y") 'self-insert-command)
    (global-set-key (kbd "Z") 'self-insert-command)

))

;; 67890
;; fgcrl
;; dhtns
;; x z
;;

(defun xfk-mode-toggle ()
  "Switch between {insertion, command} modes."
  (interactive)
  (if xfk-insert-state-q
      (xfk-command-mode-activate)
    (xfk-insert-mode-activate)))

(defun xfk-command-mode-activate ()
  "Activate command mode."
  (interactive)
  (modify-all-frames-parameters (list (cons 'cursor-type 'box)))
  (setq xfk-insert-state-q nil )
  (xfk-command-mode-init))

(defun xfk-insert-mode-activate ()
  "Activate insertion mode."
  (interactive)
  (modify-all-frames-parameters (list (cons 'cursor-type 'bar)))
  (setq xfk-insert-state-q t )
  (xfk-insert-mode-init))



;; when in going into minibuffer, switch to insertion mode.
(add-hook 'minibuffer-setup-hook 'xfk-insert-mode-activate)
(add-hook 'minibuffer-exit-hook 'xfk-command-mode-activate)

;; TODO when in shell mode, switch to insertion mode.
(add-hook 'shell-mode-hook 'xfk-insert-mode-activate)



;; (setq xah-fly-timer-id (run-with-idle-timer 20 t 'xfk-command-mode-activate))
;; (cancel-timer xah-fly-timer-id)

;; (define-minor-mode MODE▮ "DOC" &optional INIT-VALUE LIGHTER KEYMAP &rest
;; BODY) 


(provide 'xah-fly-keys)
