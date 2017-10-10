---
title: Balade avec NVM
description: Comment gérer ses versions de Node.js
date: 2017-10-09
author: Bruno
---
Moult scénarios sont envisageables pour récupérer Node.js sur une machine:

- se reposer sur le [package manager][1] de l'OS. Cette approche pragmatique permet de rester aligner avec la philosophie de la distribution. Les conservatrices (type Debian) vous fournissent ainsi en priorité des versions *Long Term Support*, éprouvées mais hélas un poil *datées*. Les distributions en mode rolling release (type Arch) distillent la dernière version, fraichement taguée.
- [compiler depuis la source][2], via l'éternelle incantation `./configure && make && make install`
- piocher l'image souhaitée sur le [hub docker][3]
- aller à la [pêche aux binaires][4]

## Une nodothèque bien au chaud sur son Thinkpad

Sur une bécane dédiée au développement, la dernière approche semble intéressante puisqu'elle permet de pouvoir bosser sur plusieurs projets en parallèle. Suivant leurs ages respectifs on peut lancer les applications via la version de node qui va bien.
Par exemple si un vieux projet non critique tourne encore sur une `0.12` et qu'aucune migration n'est à l'ordre du jour, on peut dégainer `node` en renseignant explicitement le chemin pointant vers l'endroit où le binaire couvert de toile d'araignées attend sagement.

La difficulté réside dans la discipline dont il faut faire preuve pour ne pas s'emmêler les pinceaux.

**NVM** est justement un outil répondant à cette problématique, sensé nous simplifier la tache. Partons pour un petit tour du propriétaire.

![baballes](/img/blog/nvm-node/nvm-balls.jpg)

## Spéléo

Le [Node Version Manager][5] (acronyme à ne pas confondre avec les non moins célèbres [NPM][6] ou [NKM][7]) fut initialement développé par le pionnier [Tim Caswell (a.k.a creationix)][8]. Depuis ses débuts dès 2010, ce sont plus de 200 contributeurs qui se sont relayés et partagent aujourd'hui le pactole de 22000 étoiles GitHub.

Si on exclut le dossier dédié aux tests, l'arborescence de son code source est plate. En débroussaillant les quelques dotfiles et autres markdowns qui l'encombrent, on tombe sur la matière première du projet qui se résume en un bon gros script shell de 3500 lignes, [nvm.sh][9].

## Recette de coquillage

Suivant votre sensibilité et vos expériences passées, le choix de cette *techno* pourrait vous faire grincer des dents. Heureusement, l'incipit de ce fichier nous rassure un peu en mentionnant qu'une attention a été portée au respect de `POSIX` et que [shellCheck][10] se charge d'assurer nos arrières.

Pareil *langage primitif* (dans le sens non péjoratif du terme) pour ce genre d'utilitaire est une décision en phase avec son rôle et les ficelles qu'il manipule pour accomplir sa mission. Et puis dans une ère où les `Makefile` sont sacrifiées au profit de `Gulpfile` rédigées dans notre dialecte familier, on butte d'entrée de jeu face à un paradoxe : comment installer node avec un outil qui serait écrit en JavaScript et nécessitant donc un node pour le faire tourner?

Le prix à payer est que le support de Windows en pâtit, et qu'il faut se tourner vers des solutions alternatives pour cette plateforme telles que [nvm-windows][11] ou [nodist][12].

## Installation de NVM

Ah! La fameuse phase où il faut installer l'installeur.
Le README nous propose de *piper* bien gentiment le *curling* de `install.sh` dans le shell de notre choix (dash, bash, zsh, PAS fish):

```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
```

Par défaut, nvm va établir son campement de base dans `$HOME/.nvm`:

```sh
nvm_install_dir() {
  printf %s "${NVM_DIR:-"$HOME/.nvm"}"
}
```

L'installation commence par venir faire un clone du dépôt git dans le dossier ci dessus. Les mises à jour futures de nvm se résument par la suite à relancer `install.sh`
De manière *légèrement* intrusive, l'installeur prend soin d'ajouter tout seul comme un grand le fait de *sourcer* `nvm.sh` depuis le `rc` de votre shell favori, par exemple `.zshrc`:

```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```

Donc en ouvrant un nouveau terminal, la *commande* `nvm` devrait être dispo.

## Utilisation de NVM

Une bonne visite commence toujours par le lancement du flag `--help` qui nous en dit plus sur les commandes courantes qui vont former notre quotidien.

Le gros du travail va se fonder sur le triptyque suivant:

- `nvm ls`: pour savoir où on en est en zyeutant la liste des nodes dispos sur la machine. Les flèches et les couleurs de l'output renseignent assez bien sur ce qui se passe. La commande cousine `nvm ls-remote` permet de faire du lèche-vitrine.
- `nvm install <version>`: nvm récupère le binaire et vient le déposer dans `~/.nvm/versions/node/`. On remarque au passage avec un certain brin de nostalgie que `iojs` est toujours supporté. Ces installations s'accompagnent de la version de npm de *l'époque*. Pour copier les packages installés avec `npm i -g` lors de manipulations précédentes, le flag `--reinstall-packages-from=<version>` tombe à pic. Mieux encore, les lister dans `$NVM_DIR/default-packages`.

Ces deux commandes sont moins fréquentes que :

- `nvm use <version>`: pour basculer à la version de node indiquée (qui doit être précédemment installée) pour la session en cours. Le gros de la *magie* de cette commande se résume en une bête modification du `$PATH` pour y ajouter / retirer le chemin vers le dossier `bin` de la version de node sélectionnée. `$MANPATH` est aussi affecté par le même traitement. Pour un lancement *one shot*, `nvm run <node> <cmd>` pour dépanner.

## Alias

A chaque fois qu'une version de node est requise en tant qu'argument d'une commande, on peut jouer la carte de la précision (ex `8.6.0`), celle du flou (ex `6`) voire carrément la paresse (ex `node` qui récupère la `latest`).

Les LTS ont des noms de code gazeux comme `lts/argon`, `lts/boron` qui sont valides.
Le mot `system` permet quant à lui de rebasculer vers le node géré par le package manager de la distribution (`apt`, `pacman`…).

`nvm alias` propose de lister ou d'inventer les vôtres (`nvm alias zizou 0.10`).
Le dessous de la machinerie se cache dans le dossier `~/.nvim/alias`.

## Nettoyage

`nvm deactivate` et `nvm unload` permettent de se débarrasser temporairement de nvm dans le shell courant. Pour une solution beaucoup plus radicale et permanente (vous jugerez des conséquences), un `rm -rf ~/.nvim` fait disparaitre votre belle collection de nodes ainsi que tous les modules globaux qui y étaient rattachés.

## La config `.nvmrc`

Les projets s'accumulent et il devient de plus en plus dur de se rappeler de quel environnement ils ont besoin pour s'exécuter.
En plaçant un manifest nommé `.nvmrc` à la racine d'un projet précisant juste la version de node requise (ex `4.2.0`), un appel à `nvm use` fera la bascule souhaitée. Pour éviter d'oublier de faire cette manip à chaque fois que l'on `cd` vers le projet, il est possible de se reposer sur des hooks `zsh` par exemple.

## Clash avec la config `prefix` de npm

L'utilisation de nvm sur une machine *vierge*, ne pose pas trop de soucis. Dans d'autres types d'environnements plus lourdement tunés, un problème peut survenir avec la récupération des packages js globaux. Résumé du drame:

`npm i five` installe le packages `five` dans le dossier courant. Jusqu'ici rien d'anormal. La question du répertoire de destination se pose avec l'ajout du flag `-g`.

Par défaut, `npm i -g five` place `five` dans un dossier système quelque part dans `/usr` nécessitant souvent un `sudo` entrainant parfois des [débordements fâcheux][13].

Pour se protéger, il est possible de renseigner la config `prefix` de npm:
`npm config set prefix ~/mon-petit-chemin-qui-me-plait`.

Celle ci a pour effet d'ajouter votre super valeur dans `~/.npmrc`.
Les prochains `npm i -g five` placeront les packages js dans le dossier désigné par ce prefix.

Or c'est ici que nvm vient mettre son grain de sel. Heureusement, il vous prévient de manière assez ostensible à chaque ouverture de terminal qu'il n'est pas content :
```
nvm is not compatible with the npm config "prefix" option: currently set to "/home/delapouite/.npm-global"
Run `npm config delete prefix` or `nvm use --delete-prefix v8.2.1 --silent` to unset it.
```

`nvm` souhaite en effet prendre les rênes des `npm i -g` en plaçant les packages js au sein de l'arbo `~/.nvm/versions/node`, aux cotés de la version de node choisie. Ainsi chaque `nvm use` permet non seulement de basculer de version de node mais aussi de basculer tous les packages js globaux qui y sont attachés ce qui s'avère très pratique lorsque des modules natives en C++ nécessitant une ABI compatible sont de la partie.
Mais, lorsque le `prefix` npm est renseigné, toute cette valse est court-circuitée.

Moralité de cette sombre affaire et tel qu'indiqué par le message ci dessus, il est recommandé de lâcher prise en supprimant le npm *prefix* et laisser nvm gérer la sauce.

## NeVerMind

*nvm* apporte une souplesse et facilité qui fait défaut à bien d'autres écosystèmes (Python et ses virtualenv pour ne citer que lui). Ainsi, dans des conditions moins cruciales que celles d'un contexte de production, cet outil est un allié de poids pour faciliter notre *Developer Experience* dont on aurait tort de se priver.

[1]: https://nodejs.org/en/download/package-manager/
[2]: https://github.com/nodejs/node/blob/master/BUILDING.md
[3]: https://hub.docker.com/_/node/
[4]: https://nodejs.org/dist/v8.6.0/
[5]: https://github.com/creationix/nvm
[6]: https://gist.github.com/flagpoonage/d1a34d92c4202ba07815
[7]: https://fr.wikipedia.org/wiki/Nathalie_Kosciusko-Morizet
[8]: https://github.com/creationix
[9]: https://github.com/creationix/nvm/blob/master/nvm.sh
[10]: https://www.shellcheck.net/
[11]: https://github.com/coreybutler/nvm-windows
[12]: https://github.com/marcelklehr/nodist
[13]: https://github.com/superscriptjs/superscript/issues/67
