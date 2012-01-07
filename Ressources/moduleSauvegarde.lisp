;##################################################################################################
;# GameFinder - moduleSauvegarde.lisp                                                             #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description des fonctions permettant d'ajouter des jeux dans #
;#              la base de faits                                                                  #
;##################################################################################################


;## Module de Sauvegarde ##########################################################################
;####### Fonction saveParameters ##################################################################
;# Fonction : Permet de sauvegarder les jeux ajoutés dans le fichier Données/base_jeux.lisp       #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun saveParameters ()
	(format t "Sauvegarde des paramètres... ")
	(let ((flot_sortie (open "Données/paramètres.lisp" :direction :output :if-exists :overwrite :if-does-not-exist :create)))
		(format flot_sortie ";##################################################################################################~%;# GameFinder - jeux.lisp                                                                         #~%;# Système expert d'ordre 0+                                                                      #~%;# Auteur: Ubu - ubald2b@gmail.com                                                                #~%;# Date: 29/12/2011                                                                               #~%;# Description: Fichier contenant la description de tous les paramètres pour la recherche         #~%;##################################################################################################~%(defparameter *PARAMETERS* '~S)~%" *parameters*)
		(dolist (e *parameters*)
			(format flot_sortie "(defparameter *~S* '~S)~%" (car (eval e)) (eval e))
		)
		(close flot_sortie)
	)
	(format t "Terminé.~%")
)

;####### Fonction addParameter ####################################################################
;# Fonction : Permet d'ajouter un paramètre                                                       #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun addParameter (parameter &aux temp_input (temp_list (copy-list (eval parameter))))
	(separate)
	(printParameter temp_list 1)
	(format t "Ecrivez la valeur à ajouter: ")
	(setq input (read))
	(setq temp_list (list (car temp_list) (append (cadr temp_list) (list input))))
	(printParameter temp_list 1)
	(loop
		(format t "Valider la modification? (y/n) ")
		(setq input (read))
		(case input
			('y (set parameter (copy-list temp_list)) (saveParameters) (separate) (return-from nil T))
			('n (separate) (return-from nil nil))
		)
	)
)

;####### Fonction addGame #########################################################################
;# Fonction : Permet d'ajouter un jeu dans la liste des jeux                                      #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun addGame (&aux input choix)
	(separate)
	(format t "Entrez le nom du jeu à ajouter: ")
	(setq input (read))
	(format t "Jeu: ~S~%" (append (list (list 'nom input)) *fait*))
	(loop
		(format t "Valider? (y/n) ")
		(setq choix (read))
		(case choix
			('y (saveGame input) (separate) (return-from nil input))
			('n (separate) (return-from nil nil))
		)
	)
)

(defun saveGame (nom &aux flot_sortie)
	(setq flot_sortie (open "Données/jeux.lisp" :direction :output :if-exists :append :if-does-not-exist :error))
	(format t "Ajout du jeu dans la liste... ")
	(format flot_sortie "~%~%(add_rule '((condition ")
	(dolist (i *fait*)
		(format flot_sortie "~S " i)
	)
	(format flot_sortie ") (consequence (nom ~S))))" nom)
	(close flot_sortie)
	(load "Données/jeux.lisp")
	(format t "Terminé.~%")
)
;##################################################################################################
