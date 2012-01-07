;##################################################################################################
;# GameFinder - fonctionsServices.lisp                                                            #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description des fonctions de service utilisées par le système#
;#              expert                                                                            #
;##################################################################################################


;## Fonctions de service ##########################################################################
;####### Fonction appartient ######################################################################
;# Fonction : Permet de determiner si un élément appartient à une liste                           #
;# Paramètre : Le premier paramètre est l'élément à tester et le second la liste à tester         #
;# Retour : T s'il trouve l'élément et nil sinon                                                  #
;##################################################################################################
(defun appartient (element liste)
	(if (not (null (car liste)))
		(if (not (equal element (car liste)))
			(appartient element (cdr liste))
			T
		)
		nil
	)
)

;####### Fonction elementn ########################################################################
;# Fonction : Renvoie le nième élément d'une liste                                                #
;# Paramètre : Le premier paramètre est la liste et le second et le n° de l'élément dans la liste #
;# Retour : nième élément de la liste                                                             #
;##################################################################################################
(defun elementn (liste numero)
	(if (or (null liste) (equal 0 numero))
		(format t "Erreur: Pas d'élément correspondant~%")
		(if (equal numero 1)
			(car liste)
			(elementn (cdr liste) (- numero 1))
		)
	)
)

;####### Fonction separate ########################################################################
;# Fonction : Imprime une séparation                                                              #
;# Paramètre : (Optionnel) Nombre de sauts que l'on doit effectuer après la séparation            #
;#             (par défaut 1)                                                                     #
;# Retour : rien                                                                                  #
;##################################################################################################
(defun separate (&optional (caractere '_) (before 0) (after 1))
	(dotimes (i before)
		(format t "~%")
	)
	(dotimes (i 80)
		(format t "~S" caractere)
	)
	(if (equal caractere '_)
		(format t "~%")
	)
	(dotimes (i after)
		(format t "~%")
	)
)
;##################################################################################################
