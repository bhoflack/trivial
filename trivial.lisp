(in-package :trivial.db)

(defclass object ()
  ((id :initarg :id :reader id)))

(defclass tree (object)
  ((items :initarg :items :reader items)))

(defclass value (object)
  ((name  :initarg :name  :reader name)
   (value :initarg :value :reader value)))
				    
(defgeneric make-column (name type &key default-value value))

(defmethod make-column (name (type (eql 'string)) &key default-value value)
  (make-instance 'value
		 :name name
		 :value value))

(defmethod make-column (name (type (eql 'tree)) &key default-value value)
  (make-instance 'tree))

(defun make-schema (spec)
  (make-instance 'tree :items (mapcar #'(lambda (column-spec) (apply #'make-column column-spec)) spec)))
    				   
	       	       		   
			       	    
			       	      
				       	  
     				       	   
    



