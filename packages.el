;;; packages.el --- execline layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Eric Le Bihan <eric.le.bihan.dev@free.fr>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst execline-packages
  '(
    company
    (execline-mode :location (recipe
                              :fetcher github
                              :repo "elebihan/execline-mode"
                              :branch "master"))
    (company-execline :location (recipe
                                 :fetcher github
                                 :repo "elebihan/company-execline"
                                 :branch "master")
                      :toggle (configuration-layer/layer-usedp 'company))
    ))

(defun execline/init-execline-mode ()
  (use-package execline-mode
    :defer t
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'execline-mode
        "eb" 'execline-execute-buffer
        "er" 'execline-execute-region
        "es" 'execline-execute-string))))

(defun execline/init-company-execline ()
  (use-package company-execline
    :defer t
    :init
    (push 'company-execline company-backends-execline-mode)))

(defun execline/post-init-company ()
  (spacemacs|add-company-hook execline-mode))

;;; packages.el ends here
