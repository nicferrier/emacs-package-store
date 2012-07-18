;;; package-store.el --- a package cache

;; Copyright (C) 2012  Nic Ferrier

;; Author: Nic Ferrier <nferrier@ferrier.me.uk>
;; Maintainer: Nic Ferrier <nferrier@ferrier.me.uk>
;; Created: 17th July 2012
;; Version: 0.1
;; Keywords: lisp, http, hypermedia

;; This file is NOT part of GNU Emacs.

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
;;
;; A simple adaption for Emacs' package system, this stores downloaded
;; packages directly in a cache.  This promotes easier transfer to
;; other machines or disconnected (from the Internet) testing.

;;; Source code
;;
;; package-store's code can be found here:
;;   http://github.com/nicferrier/package-store

;;; Style note
;;
;; This codes uses the Emacs style of:
;;
;;    package-store--private-function
;;
;; for private functions.


;;; Code:

(defcustom package-store-cache-dir
  (concat user-emacs-directory "package-cache")
  "The directory to store downloaded packages."
  :type 'directory)

;;;###autoload
(defadvice package-download-tar (around
                                 package-store-do-cache-tar
                                 activate)
  "Turn on caching around tar downloads.

Downloads are cached to `package-store-cache-dir'."
  (if (and
       package-store-cache-dir
       (file-exists-p package-store-cache-dir)
       (file-directory-p package-store-cache-dir))
      (let ((url-automatic-caching t)
            (url-cache-directory package-store-cache-dir))
        ad-do-it)
      ad-do-it))

;;;###autoload
(defadvice package-download-single (around
                                 package-store-do-cache-file
                                 activate)
  "Turn on caching around tar downloads.

Downloads are cached to `package-store-cache-dir'."
  (if (and
       package-store-cache-dir
       (file-exists-p package-store-cache-dir)
       (file-directory-p package-store-cache-dir))
      (let ((url-automatic-caching t)
            (url-cache-directory package-store-cache-dir))
        ad-do-it)
      ad-do-it))

(provide 'package-store)

;;; package-store.el ends here
