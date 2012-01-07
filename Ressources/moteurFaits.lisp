;##################################################################################################
;# GameFinder - moteurFaits.lisp                                                                  #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description des fonctions permettant de manipuler la base de #
;#              faits                                                                             #
;##################################################################################################


;## INITIALISATION ################################################################################
; Efface les base de faits éventuellement précédement définies
(defparameter *fait* nil)
;##################################################################################################


;## Fonctions de service ##########################################################################
;####### Fonction fact ############################################################################
;# Fonction : Permet de determiner la valeur associée à un fait s'il appartient à la base des     #
;#            faits                                                                               #
;# Paramètre : fait à tester                                                                      #
;# Retour : la valeur de l'élément et nil sinon                                                   #
;##################################################################################################
(defun fact (faits fait)
	(cadr (assoc fait faits))
)

;####### Fonction factHasValue ####################################################################
;# Fonction : Permet de determiner si un fait a la valeur passée en paramètre                     #
;# Paramètre : fait à tester et valeur du fait                                                    #
;# Retour : T si le fait a la valeur "valeur" et nil sinon                                        #
;##################################################################################################
(defun factHasValue (fait valeur)
	(if (equal (cadr (assoc fait *fait*)) valeur)
		T
		nil
	)
)

;####### Fonction define_facts ####################################################################
;# Fonction : Permet de determiner la base de faits                                               #
;# Paramètre : nouvelle base de faits                                                             #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun define_facts (faits)
	(setq *fait* faits)
)

;####### Fonction add_fact ########################################################################
;# Fonction : Permet d'ajouter un fait à la liste des faits                                       #
;# Paramètre : faits à ajouter                                                                    #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun add_fact (fait)
	(push fait *fait*)
)
;##################################################################################################
