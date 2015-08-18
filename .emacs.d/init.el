(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


("H" "Office and Home Lists"
     ((agenda)
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "SHOPPING")))

("D" "Daily Action List"
    (
        (agenda "" ((org-agenda-ndays 1)
                   (org-agenda-sorting-strategy
                        (quote ((agenda time-up priority-down tag-up) )))
                   (org-deadline-warning-days 0)
                   )
        )
    )
)
