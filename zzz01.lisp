
(defpackage #:zzz01
  (:use #:cl #:clog #:clog-web)
  (:export start-app))

(in-package :zzz01)

(defun start-app ()
  (initialize 'on-new-window
   :static-root (merge-pathnames "./www/"
                  (asdf:system-source-directory :zzz01)))
  (open-browser))

(defun on-new-window (body)
  (let* ((parent body)		     
	 (ndivs  5) ;; number of check boxes		     
	 (divs   (make-array ndivs)) ;; array of check boxes
	 (checkboxes (create-div parent)) ;; check boxes
	 (button (create-button parent :content "Check boxes")) ;; button
	 (notifications (create-div parent :content "Loop through array." :class "w3-light-gray w3-padding w3-margin")) ;; div to print notificaitons
	 (notifications-length (create-div parent :content "Length of array" :class "w3-light-gray w3-padding w3-margin")) ;; div to print notificaitons
	 (collection) ;; var to store number of loops done by the button
	 )                              
    ;; create some check boxes
    (dotimes (n ndivs) (progn (setf (aref divs n) (create-form-element checkboxes :checkbox  :class "w3-check  w3-quarter w3-green"))))
    ;; create a new line
    (create-br parent)
    ;; create a button
    (set-on-click button
		  (lambda (obj)
		    "On click loop through our array and reset text"
		    (declare (ignore obj))
		    (setf collection nil) ;; set counter to nil
		    (setf (text notifications) " " ) ;; set notifications to nil
		    (setf (text notifications-length)  (format nil "Length of array: ~a" (length divs))) ;; check length of array
		    (dotimes (n ndivs) ;; loop by number of checkboxes
		      (if (checkedp (aref divs n)) ;; check of check boxes are checked in array
			  (progn (setf collection (concatenate 'string (print collection)   " " (write-to-string n) " ")) ;; zero out notifications
				 (setf (text notifications) collection) ;; count the number of loops a click performs
				 (setf (checkedp (aref divs n)) nil)) ;; if checked, uncheck each checkbox array
			  (progn (setf collection (concatenate 'string (print collection)   " " (write-to-string n) " ")) ;; zero out notifications
				 (setf (text notifications) collection) ;; count the number of loops a click performs
				 (setf (checkedp (aref divs n)) t)))))))) ;;others, check each check box in array





