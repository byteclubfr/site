---
title: Angular snapshot
description: Gérer les versions instables d'Angular
date: 2015-10-12
tags: angularjs
author: Bruno
---
Lorsqu'une application bascule en phase de production il est essentiel de figer les versions de ses dépendances afin d'éviter les mauvaises surprises.
C'est d'autant plus critique dans le monde d'Angular car ce dernier ne respecte hélas pas [semver](http://semver.org).
Heureusement son [changelog](https://github.com/angular/angular.js/blob/master/CHANGELOG.md) est bien documenté pour accompagner les développeurs dans leur montée de versions.

A l'inverse, durant la phase d'incubation d'un projet, il peut quelquefois s'avérer indispensable de temporairement avoir la version la plus fraiche possible d'Angular.
Ce cas de figure se présente lorsque l'on attend une fonctionnalité du framework devant débarquer incessamment sous peu ou qu'un bug identifié est sur le point d'être corrigé.

Si l'application nécessite d'être buildée, via browserify ou webpack par exemple, Angular est alors inclus via son package npm :

```js
// en CommonJS
var angular = require('angular');

// ou ES2015
import angular from 'angular';
```

Pour avoir la version *bleeding edge*, on pourrait choisir de faire pointer la référence contenue dans le `package.json` du projet directement vers le dépôt GitHub :

```js
{
  "name": "myApp",
  "dependencies": {
    "angular": "angular/angular.js"
  }
}
```

Cette notation est un [raccourci `npm`](https://docs.npmjs.com/cli/install) permettant de récupérer via Git la branche master d'Angular. Bien sur le papier sauf que dans les faits, la situation est un peu plus compliquée.
Il arrive souvent pour une raison obscure que ce montage fasse planter npm (dans sa version 3.x du moins) et qu'aucun fichier ne soit finalement transféré. Dans le cas heureux où le téléchargement fonctionne, le package.json obtenu n'a pas de clé `main` indiquant où se situe `angular.js` car ce dernier a besoin d'être généré depuis les sources via une tache `grunt`. Une machinerie lourde à mettre en place pour une situation exceptionnelle.


L'alternative durant cette étape expérimentale de notre application est de tirer parti des CDNs fournis sur **https://code.angularjs.org**. Il s'agit souvent des liens mis en avant dans les extraits de code éparpillés dans la doc. L'astuce ici consiste à ne plus indiquer explicitement le numéro de version souhaité mais de pointer directement vers le dossier `snapshot` mis à jour de manière automatique tous les jours.

```html
<script src="https://code.angularjs.org/snapshot/angular.js"></script>
```

Inclure Angular en dur via une balise `<script>` nous oblige cette fois ci à utiliser `angular` en tant que variable globale dans notre code. Un effet de bord en apparence indésirable mais qui en réalité ne [change pas grand chose](https://github.com/angular/angular.js/blob/master/test/loaderSpec.js#L12-L15)…
