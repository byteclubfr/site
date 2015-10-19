---
title: Combiner ui-sref and ng-disabled
description: Brancher le changement d'états ui-router sur des buttons
date: 2015-10-19
tags: angularjs
author: Bruno
---
Lorsque l'on souhaite déclencher un changement d'état géré par *ui-router* depuis les templates HTML, la directive `ui-sref` permet d'effectuer ce bond de manière déclarative :

```html
<a ui-sref="company.profile">Fiche de la société</a>
```

Les avantages de la placer sur une balise de type `<a>` sont que l'on conserve une certaine approche sémantique de la navigation (je souhaite me rendre sur telle "page") et que l'attribut `href` est automatiquement généré si l'état a un URL de renseigné.

Cependant, si l'on souhaite rendre ce lien indisponible sous certaines conditions, la situation se complique et l'intention devient un peu moins claire :

```html
<a ng-click="ctrl.go('company.profile')">Fiche de la société</a>
```
```js
// dans le contrôleur associé
// …
this.go = function (state) {
	if (this.canAccess) $state.go(state);
}
// …
```

Dans ce cas de figure l'utilisation de balises `<button>` peut être pertinente. Les versions récentes d'ui-router autorisent la dépose de `ui-sref` sur tout élément *cliquable*.

Ainsi on peut tirer parti de la désactivation du bouton via `ng-disabled` sans passer par l'emploi explicite de `$state.go()` dans le contrôleur :

```html
<button ui-sref="company.profile" ng-disabled="!ctrl.canAccess">Fiche de la société</button>
```

Cette technique est d'autant plus transparente que les frameworks CSS populaires de type Bootstrap permettent aisément de partager la même apparence entre boutons et liens pour la rédaction d'application.
