---
title: 4 raisons d'adopter $q.resolve
description: Comment clarifier la génération de promesse
date: 2015-10-26
tags: angularjs
author: Bruno
---
[Le service `$q`](https://docs.angularjs.org/api/ng/service/$q) permet de manipuler des promesses dans Angular. On peut ainsi tirer parti de ce paradigme au sein des navigateurs qui [ne le supportent pas encore nativement](http://caniuse.com/#search=promises). Plus encore, c'est son branchement implicite sur le cycle de digestion du framework qui rend $q indispensable : pas besoin de se soucier d'invoquer `$scope.$apply` à tort et à travers.

Les promesses sont la monnaie d'échange asynchrone que nous fournissent la plupart des services comme `$http` pour ne citer que lui. Souvent, nos propres services ont besoin non seulement de consommer des promesses mais aussi d'en générer eux même. Si la valeur que l'on souhaite retourner est déjà disponible, il convient néanmoins de l'encapsuler dans une promesse pour respecter l'uniformité de notre API. Pour ce faire, Angular nous propose la notion de `defer` :


```js
var deferred = $q.defer();
var promise = deferred.promise;
deferred.resolve(42);

```

Cette petite danse avec les defers n'est ni exagérément longue ni compliquée mais elle vient tout de même complexifier inutilement notre code si répétée trop souvent.
Pour cette raison, Angular met à disposition la fonction `$q.when`, [raccourci](https://github.com/angular/angular.js/blob/master/src/ng/q.js#L500-L504) pour le snippet de code ci dessus.

Le nom de cette fonction est hélas discutable, *when* introduit en effet un nouveau vocabulaire sur la table. Angular 1.4.1 rectifie le tir en ajoutant [un alias](https://github.com/angular/angular.js/commit/3ef529806fef28b41ca4af86a330f39a95699cf6) plus parlant : `$q.resolve`.

Voici quelques raisons d'abandonner `$q.when` et de lui favoriser `$q.resolve` dans les nouvelles applications ou refactos :

### Symétrie avec l'API native

Les promesses telles qu'implémentées en [ES6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) disposent elles aussi du couple `Promise.resolve` et `Promise.reject`

### Le routage conserve sa propre nomenclature

```js
$routeProvider
  .when('/', { templateUrl: 'views/home.html' })
  .when('/company', { templateUrl: 'views/company.html' })
```

Lorsque l'on décrit la table de routage de ngRoute, l'emploi de la fonction `when` y a une toute autre signification. Mieux vaut se passer du malentendu potentiel entre les deux sens.

### Plus de confusions avec when.js

$q s'inspire de [Q](https://github.com/kriskowal/q), non de [when](https://github.com/cujojs/when).

### Moins de fautes de frappe

En fin de journée les doigts sont engourdis et les yeux semi clos. On a vite fait d'intervertir involontairement des `then` et des `when` au sein d'un flot asynchrone. Même l'autocompleteur de l'IDE peut faire l'étourderie.
