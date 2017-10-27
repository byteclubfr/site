---
title: "this, c'est qui, c'est quoi ?"
description: Un ami qui vous veut du bien…
date: 2017-10-25
author: Nicolas
tags: javascript, complot
---

S'il y a bien un mot-clé en JavaScript qui fait frémir les plus chevronnés des développeurs (sans faire sourciller les débutants, encore insouciants), c'est ``this``. Cette espèce de variable magique dont on croit pouvoir maîtriser la valeur mais qui n'en fait qu'à sa tête, qui est-il ? D'où vient-il ? <s>Formidable robot des temps nouveaux</s>…

Faisons un tour <s>rapide</s> :)

## Qui est ``this`` ?

Il s'agit d'un mot-clé réservé, nom d'une variable qui est toujours *définie*, mais dont la valeur peut varier en fonction du contexte d'exécution du bloc dans laquelle est elle utilisée.

Et là, j'en entends qui ronchonnent « Mais qu'est-ce qu'il raconte ? ``this`` c'est le truc qu'on met dans une méthode d'objet pour faire référence à l'instance, LOL noob ». Oui mais non. Il se trouve que lors de l'appel d'une méthode d'objet, la valeur de ``this`` sera l'objet dans le scope de la méthode, mais ce n'est qu'un cas particulier (sur 5 possibles en fait).

## Comment est définie sa valeur ?

Lors de l'appel d'une fonction (c'est important, c'est à **L'APPEL** de la fonction, et non lors de sa déclaration que la valeur de ``this`` est décidée), l'interpréteur va créer un scope et coller quelques variables dedans (que j'appelle *magiques* parce que c'est fait implicitement) comme le bon vieux ``arguments`` et notre ``this``. Pour décider de la valeur à affecter, il va se poser plein de questions ! Le principe général est celui-là :


* « OK, tu as mis des parenthèses avec une expression à gauche, tu veux donc appeler une fonction » ;
* « OK, l'expression est bien une fonction, je lui crée un scope vide » ;
* « Alors… regardons un peu tout ça, l'expression est-elle de la forme ``object.property`` ou ``object[property]`` ? » ;
  * Oui : ``this = object``, c'est le cas classique qu'on recherche en général ;
  * Non : ``this = valeur par défaut``.

[Mis en image](http://www.graphviz.org/) ça donnerait ça (image cliquable) :

[![Graphe de décision de la valeur de this, en bref](/img/blog/this/graph1.dot.png)](/img/blog/this/graph1.dot.png)

Exemple :

```js
const object = {
  name: 'toto',
  getName: function () {
    return this.name
  }
}

object.getName() // this = le truc à gauche du point → this = object
```

Mais du coup :

```js
const foo = object.getName

foo() // pas de point, pas de chocolat → this = valeur par défaut
```

Donc déjà, on peut conclure que pour prévoir la valeur de ``this``, voir l'implémentation de la fonction ne peut pas suffire, il faut que je vois comment elle est *appelée*.

### Valeur "par défaut" ?

Bon, ça semble relativement simple comme ça. Même si cette histoire de valeur qui change selon la manière dont est appelée la fonction ne nous arrange pas tellement. D'ailleurs, c'est quoi la *valeur par défaut* de ``this`` ? Et bien ça dépend du **mode** :

* En [mode *strict*](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Strict_mode) : ``this = undefined`` ;
* En mode *pourrave* : ``this = context global`` (``global`` dans Node, ``window`` dans le navigateur).

Ah, ça se complique un peu mais ça reste gérable. Reprenons notre exemple :

```js
// avec 'use strict' en tête de fichier
// ou avec 'use strict' en tête du corps de la fonction getName originale
foo() // TypeError: Cannot read property 'name' of undefined

// sinon
foo() // valeur de la globale name : dans votre console navigateur ce sera probablement ""
```

« Roh ça va, ça fait pas si peur ``this`` quand-même ! » dites-vous alors, naïfs que vous êtes.

![C'est pas fini !](/img/blog/this/more1.jpg)

### ``foo.call()`` et ``foo.apply()``

Ces méthodes des instances du constructeur ``Function`` permettent d'appeler une fonction en prenant le contrôle de la valeur de ``this`` vous-même, chic ! elles s'utilisent ainsi :

* ``foo.call(valeurDeThis, arg1, arg2, …)`` ;
* ``foo.apply(valeurDeThis, [ arg1, arg2, … ])``.

Exemple :

```js
const object = {
  name: 'Toto',
  sayHi: function (greeting) {
    'use strict'
    return `${greeting || 'Hi'} ${this.name}`
  }
}

const foo = object.sayHi
foo() // TypeError
foo.call(object, 'Hello ') // 'Hello Toto'
foo.apply(object, ['Coucou ']) // 'Coucou Toto'

// Mais bien sûr
object.sayHi.call({ name: 'Bob' }) // 'Hi Bob'
```

Ah ah je vous vois commencer à frémir, « mais alors, n'importe qui peut mettre ce qu'il veut comme valeur pour mon ``this`` à moi ? ». Oui, bien entendu. Et on pouvait de toute façon déjà en créant un objet intermédiaire et en collant votre fonction en propriété de cet objet. Y aurait-il un moyen de forcer une valeur fixe ?…

![C'est pas fini !!](/img/blog/this/more2.png)

### Les fonctions *liées*

Il est possible de *lier* (*bind*) une fonction, ce qui signifie en JavaScript qu'on va lui coller une valeur pour son ``this`` qui ne changera plus jamais. Quand je dis plus jamais, c'est plus jamais :

```js
// La méthode "bind" d'une fonction retourne une nouvelle fonction
// cette nouvelle fonction a un "this" figé pour toujours
const bar = foo.bind(object)

bar() // 'Hi Toto'
bar.call({ name: 'Bob' }) // M'en fous, toujours 'Hi Toto'

const object2 = { name: 'John', sayHi: bar }
object2.sayHi() // Nope, toujours 'Hi Toto'

const bar2 = bar.bind({ name: 'Terminator' })
bar2() // Hé ouais, toujours 'Hi Toto'
```

On a déjà sacrément agrandi la liste des questions que l'interpréteur se pose en réalité pour savoir quoi mettre comme valeur de ``this``. Mais… quoi ? Oui…

![C'est pas fini !!!](/img/blog/this/more3.gif)

### Les fonctions fléchées

J'ai pour l'instant occulté un problème vieux comme JavaScript : ``this`` et les fonctions imbriquées. En effet, un ``this`` est créé pour **chaque** fonction, du coup en cas de fonctions imbriqués impossible d'accéder au ``this`` de la fonction parente (puisque ``this`` fera référence à celui de la fonction enfant). Damned !

```js
const object = {
  name: 'Toto',
  getName: function () {
    return this.name
  },
  sayHiLater: function () { // fonction 1
    // Ici, this sera (a priori) = object
    setTimeout(function () { // fonction 2
      // Mais là, c'est le this de la fonction 2, qui est défini…
      // … en fonction de la façon dont la fonction est appelée
      // c'est-à-dire loin, très loin, dans le code de setTimeout !
      console.log('Hi', this.getName()) // Plantera probablement
    })
  }
}
```

La solution la plus célèbre est le bon vieux ``self = this`` :

```js
sayHiLater: function () { // fonction 1
  const self = this // variable "self" dans le scope parent
  setTimeout(function () { // fonction 2
    // ici this = un truc pourri
    // mais self est accessible, et a pour valeur le this parent
    console.log('Hi', self.getName()) // 'Hi Toto'
  })
}
```

Ça peut vite faire beaucoup de ``self = this`` dès qu'on a des classes et un peu d'asynchrone… Brrrr.

JavaScript introduit, dans sa version ES2015, une nouvelle syntaxe plus courte : les [fonctions fléchées](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Fonctions/Fonctions_fl%C3%A9ch%C3%A9es). Mais ce n'est pas qu'une nouvelle syntaxe car la particularité des fonctions déclarées de cette manière est qu'elles sont toujours exécutées avec un **scope vide**. Pas de variable magique ! Pas de ``arguments`` ni de ``this`` initialisé automatiquement avec des règles chelou, rien.

Donc quand on fait référence à ``this`` dans une fonction fléchée, c'est **toujours** le ``this`` du scope parent. Et cherchez pas, pour une fois, pas d'exception : on ne peut pas *lier* une fonction fléchée, et vous aurez beau l'appeler avec ``.call()`` ou ``.apply()`` point de ``this`` à l'horizon ! Plus besoin de ``self = this`` :)

```js
const object = {
  name: 'Toto',
  getName: function () {
    return this.name
  },
  sayHiLater: function () {
    setTimeout(() => {
      // this = le this de la fonction méthode "sayHiLater"
      console.log('Hi', this.getName())
    })
  }
}
```

## Un mot sur ES6

Outre les fonctions fléchées, il y a quelques nouvelles syntaxes qui pourraient nous concerner :

* Les raccourcis de méthode d'objet fonctionnent **exactement comme function** pas de piège ici ;
* Dans les classes ES6 en revanche petite subtilité : toutes les méthodes sont exécutées en mode *strict* même si rien n'est spécifié.

## Conclusion

Au final, pour connaître la valeur de ``this`` il faut savoir :

* Comment est déclarée la fonction (pas de this pour les fonctions fléchées) ;
* Si elle est liée ;
* Comment elle est appelée (syntaxe, ``call/apply``, etc…) ;
* Et enfin quel est son mode d'exécution (si rien n'est précisé, remonter de fonction en fonction jusqu'à la tête du fichier).

Le véritable arbre de décision aurait alors plutôt cette tête là (image cliquable) :

[![Graphe de décision de la valeur de this, en vrai](/img/blog/this/graph2.dot.png)](/img/blog/this/graph2.dot.png)

Et en fait j'ai omis le cas des fonctions appelées avec ``new``, mais pour rigoler un peu tous ensemble (image cliquable) :

[![Graphe de décision de la valeur de this, full disclosure](/img/blog/this/graph3.dot.png)](/img/blog/this/graph3.dot.png)

### Conclusion personnelle

C'est ainsi qu'après avoir enfin compris en détail le fonctionnement de this, après avoir acquis cette compétence ultime, certains jugeront comme moi que décidément **ce vicieux this nous les brise**.

![Fuck that shit](/img/blog/this/fuck.jpg)

Quite à avoir une variable dont la valeur provient de toute façon de l'extérieur, je me dis que je préfère l'avoir en argument explicite de ma fonction.

Et si… ``this`` était en fait un cheval de Troie posé là par Brendan, attendant son heure pour dégoûter définitivement les développeurs JS des classes et populariser de fait la programmation fonctionnelle ?
