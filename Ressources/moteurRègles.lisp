;##################################################################################################
;# GameFinder - moteurRègles.lisp                                                                 #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant les fonctions permettant de manipuler la base de règles         #
;##################################################################################################


;## INITIALISATION ################################################################################
; Efface les base de règles éventuellement précédement définies
(defparameter *regle* nil)
;##################################################################################################


;## Fonctions de service ##########################################################################
;####### Fonction is_rule #########################################################################
;# Fonction : Permet de determiner si une règle appartient à la base des règles                   #
;# Paramètre : règle à tester                                                                     #
;# Retour : T si l'élément est une règle et nil sinon                                             #
;##################################################################################################
(defun is_rule (regle)
	(appartient regle *regle*)
)

;####### Fonction get_condition ###################################################################
;# Fonction : Permet de récupérer les conditions d'une règle                                      #
;# Paramètre : règle dont on veut la condition                                                    #
;# Retour : la liste des conditions liée à la règle                                               #
;##################################################################################################
(defun get_condition (regle)
	(cdr (assoc 'condition regle))
)

;####### Fonction get_consequence #################################################################
;# Fonction : Permet de récupérer les conséquences d'une règle                                    #
;# Paramètre : règle dont on veut la conséquence                                                  #
;# Retour : la liste des conséquences liée à la règle                                             #
;##################################################################################################
(defun get_consequence (regle)
	(cdr (assoc 'consequence regle))
)

;####### Fonction addrule #########################################################################
;# Fonction : Permet d'ajouter une règle dans la base des règles                                  #
;# Paramètre : règle à ajouter                                                                    #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun add_rule (regle)
	(let ((id (gentemp "M")))
		(set id regle)
		(push id *regle*)
	)
)

;####### Fonction printParameter ##################################################################
;# Fonction : Affiche les différentes possibilités pour un parametre donné                        #
;# Paramètre : Paramètre à imprimer (Liste de la forme (parametre (value1 value2...))             #
;#             Le flag permet d'ajouter l'option "Autre" dans la liste des possibilités           #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun printParameter (parameter &optional (flag 0))
	(format t "Valeurs possibles du paramètre: ~S~%" (car parameter))
	(let ((temp_counter 1))
		(if (equal flag 0)
			(format t "0-Autre~%")
		)
		(dolist (e (cadr parameter))
			(format t "~S-~S~%" temp_counter e)
			(setq temp_counter (+ temp_counter 1))
		)
	)
)

;####### Fonction valueParameter ##################################################################
;# Fonction : Retourne la liste des valeurs possibles pour le paramètre passé en argument         #
;# Paramètre : Paramètre à évaluer (Liste de la forme (parametre (value1 value2...)))             #
;# Retour : Liste des valeurs possibles                                                           #
;##################################################################################################
(defun valueParameter (parameter)
	(let* ((temp_return (list (car parameter) (list))) (temp_fait nil) (temp_liste (cadr temp_return)))
		(dolist (e (cadr parameter)) ; On teste tous les paramètres que peut rentrer l'utilisateur et on conserve ceux qui peuvent vérifier une règle dans la base des jeux
			(setq temp_fait *fait*)
			(push (list (car parameter) e) temp_fait)
			(if (ruleValidExists *regle* temp_fait)
				(push e (cadr temp_return))
;				(setq temp_liste (list e (cadr temp_return)))
			)
		)
;		(push temp_liste (cadr temp_return))
		temp_return ; On retourne la liste des valeurs valides (qui peuvent permettre de trouver un jeu dans la base)
	)
)


;####### Fonction ruleValidExists #################################################################
;# Fonction : Parcourt la base de règles et vérifie si il existe au moins une règle qui peut être #
;#            vérifiée par la base de faits                                                       #
;# Paramètre : Base de règles sur laquelle on souhaite travailler                                 #
;#             Base de faits que l'on souhaite tester                                             #
;# Retour : T dès qu'une règle est trouvée et nil sinon                                           #
;##################################################################################################
; Est-ce qu'il existe un jeu qui corresponde à la base de règles ?
(defun ruleValidExists (regle fait)
	(if (not (null regle))
		(if (ruleIsValid (eval (car regle)) fait)
			T
			(ruleValidExists (cdr regle) fait)
		)
;		(format t "Erreur: Pas de règles valides. ~S~%" fait)
	)
)

;####### Fonction ruleIsValid #####################################################################
;# Fonction : Permet de verifier si une règle est vérifiée par une liste de faits (eventuellement #
;#            incomplete                                                                          #
;# Paramètre : Le premier paramètre est la règle que l'on veut tester                             #
;#             Le second parametre est une liste de faits à tester                                #
;# Retour : T si la règle comporte dans ses conditions tous les éléments du paramètre fait        #
;#          nil sinon                                                                             #
;##################################################################################################
(defun ruleIsValid (regle fait)
	(if (assoc 'nom (get_consequence regle))
		(let ((temp_conditions (get_condition regle)) (temp_result T))
			(dolist (i fait)
				(if (not (equal (fact fait (car i)) (cadr (assoc (car i) temp_conditions))))
					(setq temp_result nil)
				)
			)
			temp_result
		)
	)
)

;####### Fonction gameWichHasSmthgCommon ##########################################################
;# Fonction : Retourne la liste de tout les jeux qui vérifient une liste de faits                 #
;# Paramètre : Le premier paramètre est la liste de faits que l'on veut que les jeux vérifient    #
;# Retour : La liste des jeux qui vérifient la liste de faits                                     #
;#          nil si rien n'est trouvé                                                              #
;##################################################################################################
(defun gameWichHasSmthgCommon (factList)
	(let ((temp_return nil))
		(dolist (i *regle*)
			(if (ruleIsValid (eval i) factList)
				(progn
					(push (list (car (get_consequence (eval i)))) temp_return)
					(dolist (temp (get_condition (eval i)))
						(push temp (car temp_return))
					)
				)
			)
		)
		temp_return
	)
)

;####### Fonction whatGamesHaveInCommon ###########################################################
;# Fonction : Retourne la liste des faits qu'une liste de jeux ont en commun                      #
;# Paramètre : Le premier paramètre est la liste des jeux que l'on veut tester                    #
;# Retour : La liste des paramètres communs à tous les jeux de la liste                           #
;#          nil si rien n'est trouvé                                                              #
;##################################################################################################
(defun whatGamesHaveInCommon (gameList)
	(let ((temp_return nil))
		(dolist (carac (car gameList))
			(if (isCaracteristicCommon gameList carac)
				(push carac temp_return)
			)
		)
		temp_return
	)
)

;####### Fonction isCaracteristicCommon ###########################################################
;# Fonction : Vérifie si une caractéristique est commune à une liste de jeux                      #
;# Paramètre : Le premier paramètre est la liste des jeux que l'on veut tester                    #
;#             Le second paramètre est la caractéristique à tester sous la forme (carac value)    #
;# Retour : T si la caractéristique est commune à tous les jeux de la liste                       #
;#          nil sinon                                                                             #
;##################################################################################################
(defun isCaracteristicCommon (gameList carac)
	(if (null gameList)
		T
		(if (equal (cadr (assoc (car carac) (car gameList))) (cadr  carac))
			(isCaracteristicCommon (cdr gameList) carac)
			nil
		)
	)
)

;####### Fonction generateRules ###################################################################
;# Fonction : Permet de générer la liste des règles utilisées par le système expert               #
;#            Le enregistre dans le fichier /Données/règlesDyn.lisp                               #
;# Paramètre : Aucun                                                                              #
;# Retour : Rien                                                                                  #
;##################################################################################################
(defun generateRules ()
	(format t "Génération des règles... ")
	(let ((temp_return nil) (flot_sortie (open "Données/reglesDyn.lisp" :direction :output :if-exists :overwrite :if-does-not-exist :create)))
		(dolist (parameter *parameters*)
			(dolist (value (cadr (eval parameter)))
				(format flot_sortie "~%~%;Pour la valeur ~S de la liste ~S: ~%" value (car (eval parameter)))
				(format flot_sortie "(add_rule '((condition ~S) (consequence" (list (car (eval parameter)) value))
				(dolist (i (whatGamesHaveInCommon (gameWichHasSmthgCommon (list (list (car (eval parameter)) value)))))
					(format flot_sortie " ~S" i)
				)
				(format flot_sortie ")))")
			)
		)
		(close flot_sortie)
	)
	(format t "Terminé~%Base de règles disponnible dans le fichier 'Données/reglesDyn.lisp'~%*Note: Le fichier généré ne sera pas utilisé car il génère beaucoup de règles fausses...~%~%")
)
;##################################################################################################
