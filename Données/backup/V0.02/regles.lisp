;##################################################################################################
;# GameFinder - règles.lisp                                                                       #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la base de règles du logiciel                                   #
;##################################################################################################


; Jeux défini par
;	- Connection (Online/Offline)
;	- Style (multijoueur/solo)
;	- editeur (nom de l'éditeur)
;	- type (type de jeux MMO/Strategie/RPG...etc)
;	- Plateforme (console, pc...)
;	- Année
;	- Materiel/Immateriel (steam...etc) ?
;	- Prix ?

;	- nom (c'est ce qu'on veut obtenir au final)


;## Ajout des règles dans la base #################################################################
; Remarques:
; 	Règle de la forme ((condition (liste de conditions)) (conséquences (liste de conséquences)))
; 	Passer la règle à la fonction add_rule pour l'ajouter à la base de règles

; Condition Type
(add_rule '((condition (type MMORPG))
			(consequence (style Multijoueur)
						 (connection Indispensable)))
)
(add_rule '((condition (type FPS))
			(consequence (style Multijoueur)))
)
(add_rule '((condition (type STR))
			(consequence (style Multijoueur)))
)
(add_rule '((condition (type RPG))
			(consequence (connection Inutile)))
)
(add_rule '((condition (type MOBA))
			(consequence (style Multijoueur)
						 (connection Indispensable)))
)

; Condition Plateforme
(add_rule '((condition (plateforme Playstation))
			(consequence (connection Inutile)))
)
(add_rule '((condition (plateforme Playstation2))
			(consequence (connection Inutile)))
)
(add_rule '((condition (plateforme Nitendo))
			(consequence (connection Inutile)))
)

; Condition Editeur
(add_rule '((condition (editeur Blizzard))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur Squaresoft))
			(consequence (plateforme Playstation)
						 (type RPG)))
)
(add_rule '((condition (editeur Mojhang))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur ElectronicArts))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur Westwood))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur Maxis))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur Valve))
			(consequence (plateforme Ordinateur)))
)
(add_rule '((condition (editeur Activision))
			(consequence (plateforme Ordinateur)))
)

; Condition Série
(add_rule '((condition (serie Starcraft))
			(consequence (editeur Blizzard)
						 (developpeur Blizzard)))
)
(add_rule '((condition (serie Starcraft))
			(consequence (developpeur Blizzard)))
)
(add_rule '((condition (serie Diablo))
			(consequence (editeur Blizzard)
						 (developpeur Blizzard)))
)
(add_rule '((condition (serie SimCity))
			(consequence (developpeur Maxis)))
)
(add_rule '((condition (serie CallOfDuty))
			(consequence (editeur Activision)))
)
(add_rule '((condition (serie Battlefield))
			(consequence (editeur ElectronicArts)))
)
;##################################################################################################
