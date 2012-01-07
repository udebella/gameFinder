;##################################################################################################
;# GameFinder - jeux.lisp                                                                         #
;# Système expert d'ordre 0+                                                                      #
;# Auteur: Ubu - ubald2b@gmail.com                                                                #
;# Date: 29/12/2011                                                                               #
;# Description: Fichier contenant la description de tous les paramètres pour la recherche         #
;##################################################################################################
(defparameter *PARAMETERS* '
(*TYPE* *SERIE* *EDITEUR* *DEVELOPPEUR* *PLATEFORME* *STYLE* *CONNECTION*
 *ANNEE*))
(defparameter *TYPE* '(TYPE (RPG HACKNSLASH MMORPG FPS MOBA GESTION STR PLATEFORME AVENTURE)))
(defparameter *SERIE* '
(SERIE
 (AUCUNE SPYRO WARCRAFT STARCRAFT DIABLO FINALFANTASY MARIO COMMANDANDCONQUER
  DUNE SIMCITY COUNTERSTRIKE BATTLEFIELD CALLOFDUTY HALO CIVILIZATION)))
(defparameter *EDITEUR* '
(EDITEUR
 (UNIVERSALSTUDIOS VIVENDI BLIZZARD SONY NITENDO ELECTRONICARTS SIERRA
  ACTIVISION MOJHANG GOA MICROSOFT SQUAREENIX THQ MICROPROSE INFOGRAMES 2KGAMES
  INDEPENDANT)))
(defparameter *DEVELOPPEUR* '
(DEVELOPPEUR
 (INSOMNIACGAMES BLIZZARD SQUARESOFT NITENDO ELECTRONICARTS WESTWOOD MAXIS
  VALVE DIGITALILLUSIONS INFINITYWARD MOJHANG RIOT TREYARCH BUNGIE SQUAREENIX
  IRONLORE MICROPROSE FIRAXIS S2GAMES)))
(defparameter *PLATEFORME* '(PLATEFORME (PLAYSTATION SUPERNITENDO ORDINATEUR PLAYSTATION2 XBOX)))
(defparameter *STYLE* '(STYLE (MONOJOUEUR MULTIJOUEUR)))
(defparameter *CONNECTION* '(CONNECTION (INDISPENSABLE UTILE INUTILE)))
(defparameter *ANNEE* '
(ANNEE
 (1992 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008
  2009 2010 2011)))
