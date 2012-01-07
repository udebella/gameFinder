;##################################################################################################
;# GameFinder - jeux.lisp                                                                         #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la base de données des Jeux                                     #
;##################################################################################################
(add_rule '((condition
				(style Monojoueur)
				(plateforme Playstation2)
				(type Plateforme)
				(connection Inutile)
				(editeur UniversalStudios)
				(developpeur InsomniacGames)
				(annee 1999)
				(serie Spyro))
			(consequence
				(nom Spyro2)))	
)

(add_rule '((condition 
				(style Multijoueur) 
				(connection Indispensable)
				(type MMORPG)
				(editeur Vivendi)
				(developpeur Blizzard)
				(plateforme Ordinateur)
				(annee 2005)
				(serie Warcraft)) 
			(consequence 
				(nom WorldOfWarcraft)))
)

(add_rule '((condition 
				(type STR) 
				(connection Indispensable)
				(style Multijoueur)
				(plateforme Ordinateur)
				(developpeur Blizzard)
				(editeur Blizzard)
				(annee 2010)
				(serie Starcraft)) 
			(consequence 
				(nom Starcraft2)))
)

(add_rule '((condition 
				(type STR) 
				(connection Utile)
				(style Multijoueur)
				(plateforme Ordinateur) 
				(editeur Vivendi)
				(developpeur Blizzard)
				(annee 2002)
				(serie Warcraft)) 
			(consequence 
				(nom Warcraft3)))
)

(add_rule '((condition 
				(type HacknSlash)
				(plateforme Ordinateur)
				(style Multijoueur)
				(Connection Utile)
				(editeur Blizzard)
				(developpeur Blizzard)
				(annee 2000)
				(serie Diablo)) 
			(consequence 
				(nom Diablo2)))
)

; Y a pas assez de champs pour l'ajouter dans la base c'est un jeu trop général comme le pendu par exemple...
;(add_rule '((condition 
;				(type Action)
;				(style Monojoueur)
;				(connection Offline)
;				(annee 1987)) 
;			(consequence 
;				(nom Tetris)))
;)

(add_rule '((condition
				(style Monojoueur)
				(connection Inutile)
				(editeur Sony)
				(developpeur Squaresoft)
				(plateforme Playstation)
				(type RPG)
				(annee 1997)
				(serie FinalFantasy))
			(consequence 
				(nom FinalFantasy7)))
)

(add_rule '((condition 
				(type Plateforme)
				(style Monojoueur)
				(connection Inutile)
				(editeur Nitendo)
				(developpeur Nitendo)
				(plateforme SuperNitendo)
				(annee 1992)
				(serie Mario))
			(consequence 
				(nom SuperMarioWorld)))
)

(add_rule '((condition 
				(type STR)
				(style Multijoueur)
				(connection Utile)
				(editeur ElectronicArts)
				(developpeur ElectronicArts)
				(plateforme Ordinateur)
				(annee 2007)
				(serie CommandAndConquer))
			(consequence 
				(nom CommandAndConquer3)))
)

(add_rule '((condition 
				(type STR)
				(style Multijoueur)
				(connection Utile)
				(editeur ElectronicArts)
				(developpeur Westwood)
				(plateforme Ordinateur)
				(annee 1998)
				(serie Dune))
			(consequence 
				(nom Dune2000)))
)

(add_rule '((condition 
				(type Gestion)
				(style Monojoueur)
				(connection Inutile)
				(editeur ElectronicArts)
				(developpeur Maxis)
				(plateforme Ordinateur)
				(annee 1999)
				(serie SimCity))
			(consequence 
				(nom SimCity3000)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(editeur Sierra)
				(developpeur Valve)
				(plateforme Ordinateur)
				(connection Utile)
				(annee 2000)
				(serie CounterStrike))
			(consequence 
				(nom CounterStrike)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(connection Indispensable)
				(editeur ElectronicArts)
				(developpeur DigitalIllusions)
				(plateforme Ordinateur)
				(annee 2005)
				(serie Battlefield))
			(consequence 
				(nom Battlefield2)))
)

(add_rule '((condition 
				(type FPS)
				(style Multijoueur)
				(connection Utile)
				(editeur Activision)
				(developpeur InfinityWard)
				(plateforme Ordinateur)
				(serie CallOfDuty)
				(annee 2005))
			(consequence 
				(nom CallOfDuty2)))
)

(add_rule '((condition 
				(type Aventure)
				(editeur Mojhang)
				(developpeur Mojhang)
				(plateforme Ordinateur)
				(style Multijoueur)
				(connection Utile)
				(serie Aucune)
				(annee 2011))
			(consequence 
				(nom Minecraft)))
)

(add_rule '((condition (SERIE AUCUNE) (ANNEE 2009) (CONNECTION Indispensable) (PLATEFORME ORDINATEUR) (DEVELOPPEUR RIOT) (EDITEUR GOA) (STYLE MULTIJOUEUR) (TYPE MOBA) ) (consequence (nom LEAGUEOFLEGENDS))))

(add_rule '((condition (ANNEE 1996) (CONNECTION Inutile) (STYLE MONOJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR BLIZZARD) (EDITEUR BLIZZARD) (SERIE DIABLO) (TYPE HACKNSLASH) ) (consequence (nom DIABLO))))

(add_rule '((condition (ANNEE 1998) (CONNECTION UTILE) (PLATEFORME ORDINATEUR) (EDITEUR BLIZZARD) (DEVELOPPEUR BLIZZARD) (SERIE STARCRAFT) (STYLE MULTIJOUEUR) (TYPE STR) ) (consequence (nom STARCRAFT))))

(add_rule '((condition (ANNEE 2006) (CONNECTION UTILE) (DEVELOPPEUR TREYARCH) (PLATEFORME ORDINATEUR) (EDITEUR ACTIVISION) (SERIE CALLOFDUTY) (STYLE MULTIJOUEUR) (TYPE FPS) ) (consequence (nom CALLOFDUTY3))))


(add_rule '((condition (ANNEE 2004) (CONNECTION UTILE) (PLATEFORME XBOX) (DEVELOPPEUR BUNGIE) (EDITEUR MICROSOFT) (SERIE HALO) (STYLE MULTIJOUEUR) (TYPE FPS) ) (consequence (nom HALO2))))


(add_rule '((condition (ANNEE 1999) (STYLE MONOJOUEUR) (PLATEFORME PLAYSTATION) (DEVELOPPEUR SQUARESOFT) (EDITEUR SONY) (SERIE FINALFANTASY) (CONNECTION INUTILE) (TYPE RPG) ) (consequence (nom FINALFANTASY8))))


(add_rule '((condition (ANNEE 2001) (STYLE MONOJOUEUR) (PLATEFORME PLAYSTATION) (DEVELOPPEUR SQUARESOFT) (EDITEUR SONY) (SERIE FINALFANTASY) (CONNECTION INUTILE) (TYPE RPG) ) (consequence (nom FINALFANTASY9))))

(add_rule '((condition (ANNEE 2002) (STYLE MONOJOUEUR) (PLATEFORME PLAYSTATION2) (DEVELOPPEUR SQUARESOFT) (EDITEUR SONY) (SERIE FINALFANTASY) (CONNECTION INUTILE) (TYPE RPG) ) (consequence (nom FINALFANTASY10))))


(add_rule '((condition (ANNEE 2004) (PLATEFORME ORDINATEUR) (DEVELOPPEUR SQUAREENIX) (EDITEUR SQUAREENIX) (SERIE FINALFANTASY) (CONNECTION INDISPENSABLE) (STYLE MULTIJOUEUR) (TYPE MMORPG) ) (consequence (nom FINALFANTASY11))))

(add_rule '((condition (ANNEE 2006) (CONNECTION UTILE) (STYLE MULTIJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR IRONLORE) (EDITEUR THQ) (SERIE AUCUNE) (TYPE HACKNSLASH) ) (consequence (nom TITANQUEST))))

(add_rule '((condition (ANNEE 1996) (CONNECTION INUTILE) (STYLE MONOJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR MICROPROSE) (EDITEUR MICROPROSE) (SERIE CIVILIZATION) (TYPE GESTION) ) (consequence (nom CIVILIZATION2))))

(add_rule '((condition (ANNEE 2001) (CONNECTION INUTILE) (STYLE MONOJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR FIRAXIS) (EDITEUR INFOGRAMES) (SERIE CIVILIZATION) (TYPE GESTION) ) (consequence (nom CIVILIZATION3))))

(add_rule '((condition (ANNEE 2005) (CONNECTION UTILE) (STYLE MULTIJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR FIRAXIS) (EDITEUR 2KGAMES) (SERIE CIVILIZATION) (TYPE GESTION) ) (consequence (nom CIVILIZATION4))))

(add_rule '((condition (ANNEE 2010) (CONNECTION UTILE) (STYLE MULTIJOUEUR) (PLATEFORME ORDINATEUR) (DEVELOPPEUR FIRAXIS) (EDITEUR 2KGAMES) (SERIE CIVILIZATION) (TYPE GESTION) ) (consequence (nom CIVILIZATION5))))

(add_rule '((condition (ANNEE 2010) (PLATEFORME ORDINATEUR) (DEVELOPPEUR S2GAMES) (EDITEUR INDEPENDANT) (SERIE AUCUNE) (CONNECTION INDISPENSABLE) (STYLE MULTIJOUEUR) (TYPE MOBA) ) (consequence (nom HEROESOFNEWERTH))))