(defun split (string)
    (loop for i = 0 then (1+ j)
          as j = (position #\Space string :start i)
          collect (parse-integer (subseq string i j))
          while j))

(defun filter-elements (N K nums)
    (declare (ignore N))
    ;; (format t "~{~A~^ ~}~%" nums)
    (let ((count (make-hash-table)))
         (dolist (elm nums)
             (incf (gethash elm count 0)))
         (let ((qualified (remove-if-not #'(lambda (x)
                                            (>= (gethash x count) K))
                                  (remove-duplicates nums :from-end t))))
              (if (null qualified)
                  (format t "-1~%")
                  (format t "~{~A~^ ~}~%" qualified)))))

(dotimes (i (read))
    (filter-elements (read) (read) (split (read-line))))