---
title: Angular i18n
description: Traduire vos applications Angular, ça marche comment ?
date: 2017-11-06
author: Thomas
tags: angular
---

# l'i18n dans a5r par t8g

L'internationalisation (i18n pour faire court) c'est un peu un marronier du développement informatique.
Au même titre qu'éditer du pdf ou qu'un système de gestion des droits (qui se terminera par tout le monde admin), on a tous fait ça plusieurs fois.

![l'i18n c'est difficile](/img/blog/angular-i18n/panneau-poubelle-speciale.jpg)

## State de l'art.

Cette fois c'est avec angular qu'on va s'y coller.
Mais avant ça un petit tour d'horizon, un "état de l'art" comme on dit.

Donc l'internationalization c'est un truc vu et revu.
Et même si j'ai l'impression d'avoir fait ça des dizaines de fois, en fait je ne me suis jamais vraiment plongé dans le sujet.
Et ben c'est pas encore cette fois que je vais m'y mettre !
Parce que honnêtement ça donne pas du tout envie.

D'un côté on a des standards bien lourds (comme beaucoup de standard, me direz-vous) : http://userguide.icu-project.org

```
"{gender_of_host, select, "
  "female {"
    "{num_guests, plural, offset:1 "
      "=0 {{host} does not give a party.}"
      "=1 {{host} invites {guest} to her party.}"
      "=2 {{host} invites {guest} and one other person to her party.}"
      "other {{host} invites {guest} and # other people to her party.}}}"
  "male {"
    "{num_guests, plural, offset:1 "
      "=0 {{host} does not give a party.}"
      "=1 {{host} invites {guest} to his party.}"
      "=2 {{host} invites {guest} and one other person to his party.}"
      "other {{host} invites {guest} and # other people to his party.}}}"
  "other {"
    "{num_guests, plural, offset:1 "
      "=0 {{host} does not give a party.}"
      "=1 {{host} invites {guest} to their party.}"
      "=2 {{host} invites {guest} and one other person to their party.}"
      "other {{host} invites {guest} and # other people to their party.}}}}"
```

![XML $&"#!](/img/blog/angular-i18n/xml-die.jpg)

Accompagnés de format bien verbeux : http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/xliff-core-v2.0-os.html en **XML** ... Diantre que j'aime le **XML** ...

Et soutenus par des outils sans doute adaptés à des professionels aguerris, mais pour le moins pas vraiment user friendly (en tout cas pour ceux que j'ai testé).

Mon co-sociétaire @naholyr a même émis l'hypothèse que la typographie incluante (un·e artiste, les tatoueur·se·s) a en fait été créée par un développeur qui en avait marre de l'i18n.

Donc abandonnons la théorie et passons à la pratique.

## Y'a un module pour ça

Angular est un framework **fullstack**. Comme le développeur du même nom, mais qui lui fait du back. Donc rien à voir.
On aime ou on aime pas, mais Angular tente d'apporter une solution à l'ensemble des problèmatiques du développeur front (ou fullstack sur la moitié de sa vie).

Pour la partie **i18n**, on a un ensemble d'outils.

### Une directive

On veut traduire une interface, on va donc utiliser le côté déclaratif de Angular et utiliser une directive pour signifier les éléments textuels à traduire.

```html
// Utilisation de base
<h2 i18n>Welcome to the i18n application</h2>

// Avec une description
<h2 i18n="Message de bienvenue">Welcome to the i18n application</h2>

// Et une signification
Description & signification
<h2 i18n="Titre|Message de bienvenue">Welcome to the i18n application</h2>

// Il est possible de préciser un identifiant
<h2 i18n="@@welcomeTitle">Welcome to the i18n application</h2>

// Ou tout ça d'un coup
<h2 i18n="Titre|Message de bienvenue@@welcomeTitle">Welcome to the i18n application</h2>
```

Tout cela va servir à se repérer dans le fichier de traduction (dictionnaire) qui sera produit.

Il est aussi possible d'indiquer qu'attribut est traduit :

```html
<img i18n-title title="nice picture" src="image.png">
```

### Un format

Le message à traduire lui-même est compatible ICU : http://userguide.icu-project.org/formatparse/messages

```html
// Pluriel
<strong i18n="@@users">
    { users.length, plural,
      =0 {no users}
      =1 {one user}
      other {some users}
    }
</strong>

// Sélection d'une alternative
<span i18n>User is {
  user.status, select,
  on {online}
  off {offline}
  }
</span>
```

Bon tout cela est un peu verbeux, mais c'est le prix à payer. Pas trop le choix sur ce coup.

### Un outil d'extraction

Une fois qu'on a bien bossé à mettre des repères partout dans notre code, on va pouvoir extraire tout ça.
L'idée c'est de produire un fichier (dictionnaire) de référence avec toutes les chaînes i18n.

On va partir du principe que vous utilisez **@angular/cli**.
Sinon vous devriez.

```
> ng xi18n --output-path src/locale
```

Qu'on va s'empresser de rajouter à notre **package.json** :

```json
"i18n": "ng xi18n --output-path src/locale"
```

On obtient un fichier au format **xliff** : `messages.xlf`.

Et c'est tout !
On s'arrête là.
**Angular** a fait son boulot pour le moment.
De notre côté c'est le moment de traduire.
Et là, vous avez 3 possibilités :

1. Vous envoyez le fichier `messages.xlf` a un traducteur espagnol et il vous renvoit un fichier `messages.es.xlf`.
2. Vous essayez un des nombreux outils : https://en.wikipedia.org/wiki/XLIFF#Editors. Perso j'ai laissé tomber. Je dois pas être assez futé pour ça.
3. Vous faites comme moi, vous recopiez votre `messages.xlf` en `messages.es.xlf`, vous ouvrez ça avec votre éditeur favori et vous maudissez l'inventeur du **XML** sur plusieurs générations.

En gros le taf consiste à copier le fichier source *messages.xlf* et à insérer des balises `<target>` sous les balises `<source>`

```xml
<source>Welcome to the i18n application</source>
<target>Bienvenue sur l'application i18n</target>
```

### Testons nos dictionnaires

Pour tester notre application avec une locale particulière, on va tout simplement relancer le serveur de développement de **@angular/cli** en lui précisant la locale et le dictionnaire.

```
ng serve --aot --locale fr --i18n-format xlf --i18n-file src/locale/messages.fr.xlf --missing-translation error
```

Qu'il est possible de placer dans un script.

```json
"dev:fr": "ng serve --aot --locale fr --i18n-format xlf --i18n-file src/locale/messages.fr.xlf --missing-translation error"
```

L'option **--missing-translation error" interrompt la compilation sur une traduction manquante.

### Un build par locale

Ok on a pleins de dictionnaires, mais comment fait-on pour les utiliser ?

Ben on fait pas vraiment.
Pour le moment (et en particulier avec **aot**) on doit compiler une version de notre application par locale.

```
ng build --aot --output-path dist/fr --locale fr --i18n-format xlf --i18n-file src/locale/messages.fr.xlf --missing-translation error
```

Et c'est à vous de vous débrouiller pour servir le bon fichier en fonction de la langue de l'utilateur.

## My tailor is rich

L'i18n dans **angular** est un chantier en pleine ébulition.
Un grand merci à https://twitter.com/ocombe du travail réalisé.

Pour ma part j'attends avec impatience :

* Le runtime i18n (1 seul build pour plusieurs locale).
* Un service pour utiliser hors des templates.

Mais ça semble en très bon chemin : https://github.com/angular/angular/issues/16477 !
