;;; speech-snippets.el --- Yasnippets for Voice Programming

;; Copyright (C) 2014 John Mastro
;;               2018 Jack Crawley
;; (Modified from the original at:
;; https://github.com/johnmastro/react-snippets.el/blob/master/react-snippets.el
;; )

;; Authors: Jack Crawley, John Mastro <john.b.mastro@gmail.com>
;; Keywords: snippets
;; Version: 0.0.1
;; Package-Requires: ((yasnippet "0.7.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Yasnippets that are helpful for voice programming

;;; Code:

(require 'yasnippet)

(defvar speech-snippets-root
  (file-name-directory (or load-file-name (buffer-file-name))))

;;;###autoload
(defun speech-snippets-initialize ()
  (let ((snippet-dirs (list (expand-file-name "snippets" speech-snippets-root)
                            (expand-file-name "elpy-snippets" speech-snippets-root))))
    (mapc (lambda (snippet-dir)
            (when (boundp 'yas-snippet-dirs)
              (add-to-list 'yas-snippet-dirs snippet-dir t))
            (yas-load-directory snippet-dir))
          snippet-dirs)))

;;;###autoload
(eval-after-load 'yasnippet
  '(speech-snippets-initialize))

(provide 'speech-snippets)
