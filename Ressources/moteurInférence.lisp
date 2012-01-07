;##################################################################################################
;# GameFinder - moteurInférence.lisp                                                              #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description des fonctions d'explorations de la base de règles#
;##################################################################################################


;## Moteur d'inférences ###########################################################################
;####### Fonction rule_is_true ####################################################################
;# Fonction : Vérifie si les conditions d'une règle sont vraies et si elle sont vraies ajoute les #
;#            conséquences dans la liste des faits                                                #
;# Paramètre : règle à tester                                                                     #
;# Retour : T si la règle est vraie et nil sinon                                                  #
;##################################################################################################
(defun rule_is_true (regle)
	(let ((temp_conditions (get_condition regle)) (temp_test T))
		(dolist (e temp_conditions)
			(if (not (appartient e *fait*))
				(setq temp_test nil)
			)
		)
		(if (equal temp_test T)
			(dolist (e (get_consequence regle))
				(if (not (appartient e *fait*))
					(push e *fait*)
					(setq temp_test nil)
				)
			)
		)
		temp_test
	)
)

;####### Fonction verify_rules ####################################################################
;# Fonction : Parcourt la liste des règles et vérifie les règles une par une                      #
;# Paramètre : aucun                                                                              #
;# Retour : T si au moins une règle a été vérifiée                                                #
;##################################################################################################
(defun verify_rules ()
	(let ((temp_test nil))
		(dolist (e *regle*)
			(if (rule_is_true (eval e))
				(setq temp_test T)
			)
		)
		temp_test
	)
)

;####### Fonction exploreWidth ####################################################################
;# Fonction : Effectue une exploration en largeur d'abord par chainage avant                      #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun exploreWidth ()
	(loop
		(format t "~%Base de Faits: ~S~%Analyse de la base de règles...~%" *fait*)
		(let ((temp_test (verify_rules)))
			; Si on a un nom dans la base de faits, alors on a trouvé un jeu, on peut donc s'arreter
			(if (fact *fait* 'nom)
				(return-from nil (fact *fait* 'nom))
				(format t "Base de faits mise à jour.~%~%")
			)
			(if (not temp_test)
				; Proposer d'ajouter le jeu dans la base de données ici !
				(let ((temp_choix nil))
					(loop
						(format t "Pas de jeu correspondant dans la base...~%Voulez-vous ajouter votre solution? (y/n) ")
						(setq temp_choix (read))
						(case temp_choix
							('y (return-from exploreWidth (addGame)))
							('n (return-from exploreWidth nil))
						)
					)
				)
			)
		)
	)
)
;##################################################################################################
