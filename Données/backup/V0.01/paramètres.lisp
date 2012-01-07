;##################################################################################################
;# GameFinder - jeux.lisp                                                                         #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description de tous les paramètres pour la recherche         #
;##################################################################################################
(defparameter *parameters* '(*type* *editeur* *plateforme* *style* *connection*))
(defparameter *type* '(type (MMORPG Gestion STR RPG HacknSlash Action Plateforme Aventure FPS)))
(defparameter *style* '(style (Monojoueur Multijoueur)))
(defparameter *connection* '(connection (Online Offline)))
(defparameter *plateforme* '(plateforme (Playstation Nitendo Ordinateur Wii DreamCast XBox)))
(defparameter *editeur* '(editeur (Mojhang Blizzard Squaresoft Nitendo ElectronicArts Westwood Maxis Valve Activision Sony)))
