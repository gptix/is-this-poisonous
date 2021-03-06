(setf cols '(	     
	     (("1" "cap_shape" )
	      (("bell" "b") ("conical" "c") ("convex" "x") ("flat" "f") ("knobbed" "k") ("sunken" "s")))
	     
	     (("2" "cap_surface")
	      (("fibrous" "f") ("grooves" "g") ("scaly" "y") ("smooth" "s")))
	     
	     (("3" "cap_color")
	      (("brown" "n") ("buff" "b") ("cinnamon" "c") ("gray" "g") ("green" "r")
	       ("pink" "p") ("purple" "u") ("red" "e") ("white" "w") ("yellow" "y")))
	     
	     (("4" "bruises?")
	      (("bruises" "t") ("no" "f")))
	     
	     (("5" "odor")
	      (("almond" "a") ("anise" "l") ("creosote" "c") ("fishy" "y")
	       ("foul" "f") ("musty" "m") ("none" "n") ("pungent" "p") ("spicy" "s")))
	     
	     (("6" "gill_attachment")
	      (("attached" "a") ("descending" "d") ("free" "f") ("notched" "n")))
	     
	     (("7" "gill_spacing") (("close" "c") ("crowded" "w") ("distant" "d")))
	     
	     (("8" "gill_size") (("broad" "b") ("narrow" "n")))
	     
	     (("9" "gill_color") (("black" "k") ("brown" "n") ("buff" "b") ("chocolate" "h")
				  ("gray" "g") ("green" "r") ("orange" "o") ("pink" "p")
				  ("purple" "u") ("red" "e") ("white" "w") ("yellow" "y")))
	     
	     (("10" "stalk_shape") (("enlarging" "e") ("tapering" "t")))
	     
	     (("11" "stalk_root") (("bulbous" "b") ("club" "c") ("cup" "u") ("equal" "e")
				   ("rhizomorphs" "z") ("rooted" "r") ("missing" "?")))
	     
	     (("12" "stalk_surface_above_ring") (("fibrous" "f") ("scaly" "y") ("silky" "k") ("smooth" "s")))
	     
	     (("13" "stalk_surface_below_ring") (("fibrous" "f") ("scaly" "y") ("silky" "k") ("smooth" "s")))
	     
	     (("14" "stalk_color_above_ring") (("brown" "n") ("buff" "b") ("cinnamon" "c")
					       ("gray" "g") ("orange" "o") ("pink" "p")
					       ("red" "e") ("white" "w") ("yellow" "y")))
	     
	     (("15" "stalk_color_below_ring") (("brown" "n") ("buff" "b") ("cinnamon" "c") ("gray" "g")
					       ("orange" "o") ("pink" "p") ("red" "e")
					       ("white" "w") ("yellow" "y")))
	     
	     (("16" "veil_type") (("partial" "p") ("universal" "u")))
	     
	     (("17" "veil_color") (("brown" "n") ("orange" "o") ("white" "w") ("yellow" "y")))
	     
	     (("18" "ring_number") (("none" "n") ("one" "o") ("two" "t")))
	     
	     (("19" "ring_type") (("cobwebby" "c") ("evanescent" "e") ("flaring" "f") ("large" "l")
				  ("none" "n") ("pendant" "p") ("sheathing" "s") ("zone" "z")))
	     
	     (("20" "spore_print_color") (("black" "k") ("brown" "n") ("buff" "b")
					  ("chocolate" "h") ("green" "r") ("orange" "o")
					  ("purple" "u") ("white" "w") ("yellow" "y")))
	     
	     (("21" "population") (("abundant" "a") ("clustered" "c") ("numerous" "n")
				   ("scattered" "s") ("several" "v") ("solitary" "y")))
	     
	     (("22" "habitat") (("grasses" "g") ("leaves" "l") ("meadows" "m")
				("paths" "p") ("urban" "u") ("waste" "w") ("woods" "d")))))


(defun make-python-list-of-columns (data)
  (format t "[~{\"~a\"~^, ~}]" (mapcar #'cadar data)))

;;df[foo] = df[foo]w['female'].map({'female': 1, 'male': 0})

(defun build-pairs (recs)
  (let ((pairs (mapcar (lambda (r) (list (nth 1 r) (nth 3 r))) recs)))  
    (format nil "~{~{~a ~a~^,~}~}" recs)))

(defun build-one-mapping (rec)
  (let* ((pairs (nth 1 (nth 4 rec)))
	 (dct (build-dict pairs))
	 (colname (nth 3 rec)))    
    (format nil "df['~a'] = df['~a'].map(~a)" colname colname dct)))

(defun build-dict (pairs)
  (format nil "{~{~{'~a' : '~a'~}~^, ~}}" (mapcar (lambda (pr) (list (nth 3 pr) (nth 1 pr)))
						  pairs)))

(defun build-all-mappings (recs)
  (format nil "~{~A~^~%~}"(mapcar #'build-one-mapping recs)))


#|
(let ((sets-of-pairs (mapcar (lambda (rec)  (nth 1 (nth 4 rec))) recs)))
  (format nil "~{~a~^,~%~}" sets-of-pairs)))
|#
