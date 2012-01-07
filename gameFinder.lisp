;##################################################################################################
;# GameFinder - gameFinder.lisp                                                                   #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier principal contenant la fonction main du programme                         #
;##################################################################################################

; TODO Mettre à jour les commentaires (y en a beaucoup qui sont pas bons...)

;## INITIALISATION ################################################################################
(format t "________________________________________________________________________________~%~%")
(format t "Chargement des fichiers du logiciel...")

; Charge les fonctions de service
(load "Ressources/fonctionsService.lisp")

; Charge le module de sauvegarde
(load "Ressources/moduleSauvegarde.lisp")

; Charge le moteur d'inférences
(load "Ressources/moteurInférence.lisp")

; Charge la base de règles
(load "Ressources/moteurRègles.lisp")

; Charge la base de faits
(load "Ressources/moteurFaits.lisp")

; Ajout des règles dans la base
(load "Données/regles.lisp")

; Chargement des paramètres
(load "Données/paramètres.lisp")

; Chargement des jeux
(load "Données/jeux.lisp")

(format t "Terminé.~%")
(separate '_ 0 2)
;##################################################################################################

;####### Fonction main ############################################################################
;# Fonction : Fonction principale                                                                 #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun main (&aux choix)
	(printLogo)
	(loop
		(setq *fait* nil)
		(setq choix (menu))
		(separate '_ 0 2)
		(case choix
			(3 (generateRules))
			(4 (printAide))
			(5 (format t "Fin.") (return-from nil 'Fin))
			(otherwise
				(inputUser *parameters* choix)
				(format t "Résultat: ~S~%" (exploreWidth))
			)
		)	
	)
)

;####### Fonction inputUser #######################################################################
;# Fonction : Essaie de determiner un nom à partir de la base de faits                            #
;# Paramètre : aucun                                                                              #
;# Retour : le nom du jeu trouvé                                                                  #
;##################################################################################################
(defun inputUser (parameters &optional (flag 2))
	(if (not (null parameters))
		(let ((temp_parameter (eval (car parameters))))
			(verify_rules)
			(if (not (assoc (car temp_parameter) *fait*))
				(progn
					(separate '-)
					(format t "Base de Faits: ~S~%~%" *fait*)
					(if (= flag 1)
						(setq temp_parameter (valueParameter temp_parameter))
					)
					(if (= (length (cadr temp_parameter)) 1)
						(add_fact (list (car temp_parameter) (caadr temp_parameter)))
						(progn
							(loop
								(if (equal flag 1)
									(printParameter temp_parameter 1)
									(printParameter temp_parameter)
								)
								(format t "Entrez la valeur du paramètre '~S': " (car temp_parameter))
								(setq input (read))
								(if (elementn (cadr temp_parameter) input)
									(return-from nil T)
								)
								(if (and (equal input 0) (equal flag 2))
									(progn
										(addParameter (car parameters))
										(setq temp_parameter (eval (car parameters)))
									)
								)
							)
							(add_fact (list (car temp_parameter) (elementn (cadr temp_parameter) input)))
						)
					)
					(inputUser (cdr parameters) flag)
				)
				(inputUser (cdr parameters) flag)
			)
		)
	)
)

;####### Fonction menu ############################################################################
;# Fonction : Gère tout le menu de départ                                                         #
;# Paramètre : aucun                                                                              #
;# Retour : le type d'interaction souhaitée                                                       #
;##################################################################################################
(defun menu (&aux input)
	(separate)
	(format t "Menu principal:~%")
	(format t "	1-Recherche intelligente dans la base~%")
	(format t "	2-Devine le jeu auquel je pense~%")
	(format t "	3-Génération dynamique de la base de règles à partir de la base de jeux (version béta)~%")
	(format t "	4-Aide~%")
	(format t "	5-Quitter~%")
	(loop
		(format t "Entrez votre choix: ")
		(setq input (read))
		(if (and (> input 0) (<= input 5))
			(return-from nil T)
			(format t "Erreur: Choix impossible~%")
		)
	)
	input
)

;####### Fonction printAide #######################################################################
;# Fonction : Affiche l'aide                                                                      #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun printAide ()
	(separate)
	(format t "Bienvenue dans le module d'aide~%~%Ce logiciel permet de trouver un jeu à partir de plusieurs critères entrés par l'utilisateur (vous).~%	Dans la première section, vous pouvez chercher un jeu mais le logiciel ne vous proposera que les choix qui peuvent mener à un résultat.~%	Dans la deuxième section, vous pouvez entrer tous les choix que vous voulez et si le logiciel ne trouve pas de correspondance dans la base alors vous pourrez l'ajouter.~%~% Le logiciel fonctionne par questions successive pour 'remplir' une base de 'faits' et ainsi trouver le jeu correspondant à la base de faits établis. Il se peut que vous n'ayez pas toujours le même nombre de critères à rentrer car le logiciel essaie d'anticiper les choix.~%")
)

;####### Fonction printLogo #######################################################################
;# Fonction : Affiche le logo du logiciel                                                         #
;# Paramètre : aucun                                                                              #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun printLogo ()
	(separate)
	(format t "####### ####### ##   ## ####### ####### ####### ##    # #####   ####### ######~%#     # #     # ### ### #       #          #    # #   # #    #  #       #    ##~%#       #     # # ### # ####    ####       #    #  #  # #     # ####    #####~%#  #### ####### #  #  # #       #          #    #   # # #     # #       #   #~%#     # #     # #     # #       #          #    #    ## #   ##  #       #    #~%####### #     # #     # ####### #       ####### #    ## ####    ####### #     #~%")
)
;##################################################################################################


;##################################################################################################
;## Lancement du programme ########################################################################
(main)
;##################################################################################################
