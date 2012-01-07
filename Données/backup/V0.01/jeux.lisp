;##################################################################################################
;# GameFinder - jeux.lisp                                                                         #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la base de données des Jeux                                     #
;##################################################################################################
(add_rule '((condition
				(style Monojoueur)
				(plateforme Playstation)
				(type Aventure)
				(connection Offline)
				(editeur Sony))
			(consequence
				(nom Spyro)))	
)
(add_rule '((condition 
				(style Multijoueur) 
				(connection Online)
				(type MMORPG)
				(editeur Blizzard)
				(plateforme Ordinateur)) 
			(consequence 
				(nom WorldOfWarcraft)))
)

(add_rule '((condition 
				(type STR) 
				(connection Online)
				(style Multijoueur)
				(plateforme Ordinateur)
				(editeur Blizzard)) 
			(consequence 
				(nom Starcraft)))
)

(add_rule '((condition 
				(type STR) 
				(connection Offline)
				(style Multijoueur)
				(plateforme Ordinateur) 
				(editeur Blizzard)) 
			(consequence 
				(nom Warcraft)))
)

(add_rule '((condition 
				(type HacknSlash)
				(plateforme Ordinateur)
				(style Multijoueur)
				(Connection Offline)
				(editeur Blizzard)) 
			(consequence 
				(nom Diablo)))
)

(add_rule '((condition 
				(type Action)
				(style Monojoueur)
				(connection Offline)) 
			(consequence 
				(nom Tetris)))
)

(add_rule '((condition
				(style Monojoueur)
				(connection Offline)
				(editeur Squaresoft)
				(plateforme Playstation)
				(type RPG))
			(consequence 
				(nom FinalFantasy)))
)

(add_rule '((condition 
				(type Plateforme)
				(style Monojoueur)
				(connection Offline)
				(editeur Nitendo)
				(plateforme Nitendo))
			(consequence 
				(nom Mario)))
)

(add_rule '((condition 
				(type STR)
				(style Multijoueur)
				(connection Offline)
				(editeur ElectronicArts)
				(plateforme Ordinateur))
			(consequence 
				(nom CommandAndConquer)))
)

(add_rule '((condition 
				(type STR)
				(style Monojoueur)
				(connection Offline)
				(editeur Westwood)
				(plateforme Ordinateur))
			(consequence 
				(nom Dune2000)))
)

(add_rule '((condition 
				(type Gestion)
				(style Monojoueur)
				(connection Offline)
				(editeur Maxis)
				(plateforme Ordinateur))
			(consequence 
				(nom SimCity)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(editeur Valve)
				(plateforme Ordinateur)
				(connection Offline))
			(consequence 
				(nom CounterStrike)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(connection Online)
				(editeur ElectronicArts)
				(plateforme Ordinateur))
			(consequence 
				(nom Battlefield)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(connection Online)
				(editeur Activision)
				(plateforme Ordinateur))
			(consequence 
				(nom CallOfDuty)))
)

(add_rule '((condition 
				(type Aventure)
				(editeur Mojhang)
				(plateforme Ordinateur)
				(style Multijoueur)
				(connection Offline))
			(consequence 
				(nom Minecraft)))
)
