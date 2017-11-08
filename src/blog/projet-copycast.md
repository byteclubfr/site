---
title: "Nos projets open-source : copycast"
description: Partager un dossier en temps réel à votre auditoire
date: 2017-11-13
author: Nicolas
tags: javascript, opensource, project, node, cycle
---

On a décidé de mettre un peu en avant nos projets open-source, parce qu'on pense qu'ils sont utiles évidemment ;) et que le faire en Français peut être plus sympa pour vous et pour nous. On commence la série avec [`copycast`](https://github.com/byteclubfr/copycast#copycast), notre outil de partage de fichiers en temps réel.

![](https://raw.githubusercontent.com/byteclubfr/copycast/master/illustration.png)

## Genèse

Tout part d'un fait impitoyable en formation : tout le monde n'a pas la même manière d'apprendre. Chacun⋅e a un rythme mais aussi une approche différente.

Dans nos formations il y a généralement beaucoup de travaux pratiques mais aussi des phases magistrales. Dans les deux cas il peut y avoir des phases de *live coding* et c'est là que les profils varient le plus : certain⋅e⋅s auront besoin d'arrêter de coder pour pouvoir se concentrer sur les explications, d'autres au contraire auront besoin d'avoir les mains dans le cambouis en même temps pour imprimer… Comment ne pénaliser personne ?

C'est de là qu'est venue l'idée de [`copycast`](https://github.com/byteclubfr/copycast#copycast) : si le résultat du *live coding* n'est plus affiché seulement sur l'écran principal, mais aussi sur l'écran de chaque participant⋅e, chacun⋅e se concentre sur ce qu'il veut !

* J'ai besoin de me concentrer sur les explications et je n'y arrive pas avec les mains sur le clavier : pas de souci, tu feras un copier-coller à la fin ;
* J'aime coder en même temps que le formateur, explorer d'autres pistes que la sienne : pas de souci, tu auras les deux versions sous la main ;
* J'ai fait ma propre version du projet parce que j'aime m'approprier le code, mais j'ai envie de récupérer la version du formateur : pas de souci, il faut juste télécharger le dossier et hop.

## Comment ça marche ?

On installe en global (`npm i -g copycast` ou `yarn global add copycast`) puis on exécute tout simplement `copycast`.

La console affichera l'URL de connexion genre `http://192.168.24.3:42000` que les participant⋅e⋅s n'ont plus qu'à visiter :) l'arborescence du dossier courant y est visible, et les modifications apparaissent en temps réel. Chacun⋅e peut alors se balader dans le dossier du projet en toute autonomie !

On a ajouté avec le temps quelques *killer features*, chacune ayant son histoire ;)

* Exclusion de fichiers : par défaut toutes les images et polices (parce que notre but était surtout de présenter ce qui bouge, donc le code), mais aussi ce qui est dans le .gitignore ;
* Support de git : des fois on a envie de préparer le projet avec un dépôt git et des branches, parfois on commit "en live", c'était donc intéressant de pouvoir donner accès aux participant⋅e⋅s à ce dépôt en direct, du coup copycast fait aussi serveur git quand il y a un dossier `.git` ;
* On s'est rendu compte à l'usage que les participant⋅e⋅s perdaient du temps à chercher LE fichier modifié parmi l'ensemble, du coup on let met en évidence avec le temps écoulé depuis la dernière modification ;
* Il est bien sûr possible de récupérer l'archive complète de tout le dossier, sous forme de `.zip`, pour le cas « je veux récupérer le TP corrigé après la pause de midi » ;
* Support de `localtunnel` pour toutes les fois où le formateur est sur un wifi *guest* inaccessible aux participant⋅e⋅s, et que c'est bien relou… mais en fait `ngrok` s'avère plus robuste du coup cette option est peu utilisée.

[Pour le détail, RTFM](https://github.com/byteclubfr/copycast#usage).

## Et c'est fait comment ?

* On s'est amusé avec Cycle.js pour le front, c'était l'occasion de tester. J'avoue avoir un avis très mitigé sur l'outil, qui pourra faire l'objet d'un autre article… Mais ça fait le job et ça dépayse ;
* Côté back c'est évidemment du Node avec `chokidar` pour le watch et `socket.io` pour le temps réel, classique et indémodable !
* Sur le principe, on génère un arbre en mémoire qui représente l'arborescence de fichiers (avec leur contenu pour les fichiers textes d'une taille acceptable), et on balance tout ça à chaque socket ; puis lors d'une modification quelconque on met à jour l'arbre et on informe les sockets.

## Et en vrai, qui s'en sert ?

Ben nous, au moins :) On se sert de cet outil à chaque formation, et en général il plait bien aux participants donc je suis sûr que certains ont du trouver des occasions de l'utiliser. Il y aurait sûrement bien d'autres usages, et je suis sûr que pour de la formation en ligne ça pourrait déchirer !

## « C'est trop bien je veux vous aider ! »

Cool, merci ! le code est pas trop gros, c'est franchement accessible. J'ai profité de cet article de présentation pour faire ça bien en faisant un peu de ménage dans les *issues*, en créant quelques-unes, n'hésitez pas à jeter un œil :

* Le label ["help wanted"](https://github.com/byteclubfr/copycast/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22) est l'endroit idéal pour se rendre utile :)
* N'oubliez pas que de la doc, c'est toujours très sympa comme *pull request* ;)
* J'ai taggé ["good first issues"](https://github.com/byteclubfr/copycast/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) les *issues* pas forcément triviales mais bien bornée (pas de sous-entendus cachés dans un coin, pas besoin de connaître en détail 100% du code pour s'y atteler), pas sûr qu'elles soient bien "beginner-friendly" mais c'est un bon départ tout de même !
* Un expert cycle qui voudra corriger nos conneries est le bienvenue :)

À bientôt, et gloire au copier-coller !
