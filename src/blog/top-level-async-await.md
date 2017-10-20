---
title: 'async / await: le retour de la fonction main() ?'
description: Blame it on the Boogie
date: 2017-10-20
author: Bruno
tags: javascript
---
Certains enchevêtrements de callbacks ont laissé des cicatrices dans votre cœur de programmeur.
Désormais, seules les *Promises* ont le droit de citer dans votre code.
D'ici une dizaine de jours, Node 8.x.x deviendra la version LTS et c'est le feu vert que beaucoup attendent pour basculer vers le joyeux couple `async`/`await` livré en ES2017.

Une transition sans accrocs ?

## L'entrée principale

Votre petit outil chargé d'afficher les dernières chansons diffusées sur Radio France Bleu Oléron fait des merveilles depuis des années:

```js
const { getLastSongs } = require('./rfboCrawler')
const { logError } = require('./logger')
const count = Number(process.argv[2]) || 5

getLastSongs(count)
.then(songs => songs.filter(s => s.artist !== 'Jackson Five'))
.then(songs => {
  console.log(`Last ${count} songs:`)
  console.table(songs)
})
.catch(logError)
```

Comme le veut la tradition, ce fichier "maître" s'appelle `index.js` et n'attend que d'être lancé via le terminal:

```sh
$ node ~/cool-projects/rfbo/index.js 7
```

Tentons la refacto visant à *masquer* cette chaine de promesses:

```js
const { getLastSongs } = require('./rfboCrawler')
const count = Number(process.argv[2]) || 5

let songs = await getLastSongs(count)
songs = songs.filter(s => s.artist !== 'Jackson Five')
console.log(`Last ${count} songs:`)
console.table(songs)
```

Ah, nettement mieux ! Le code est plus à plat, *plus lisible*…
Oops, la gestion d'erreurs a disparu dans la transition. Réintroduisons là:

```js
const { getLastSongs } = require('./rfboCrawler')
const { logError } = require('./logger')
const count = Number(process.argv[2]) || 5

try {
  let songs = await getLastSongs(count)
  songs = songs.filter(s => s.artist !== 'Jackson Five')
  console.log(`Last ${count} songs:`)
  console.table(songs)
} catch (err) {
  logError(err)
}
```
Ce `try` / `catch` vient quelque peu ternir ce tableau qu'on voulait si élégant.
Mais c'est le prix à payer pour du code robuste. L'heure de vérité est là, relançons cette version du code:

```sh
SyntaxError: Unexpected identifier
```

Outch! Hélas, un vilain message d'erreur nous prend par surprise. Manifestement, c'est `getLastSongs` le coupable, il apparait souligné par des petits grigris comme une faute d'orthographe relevée par le correcteur de Word.

![Les Musclés](/img/blog/top-level-async-await/jackson-five.jpg)

## Une capsule temporelle

Cette erreur est loin d'être explicite et on peut tourner en rond longtemps en tentant de la résoudre.
Un interpréteur de la trempe du [compilateur de Elm][elm] pourrait pourtant nous épargner ces longues minutes (ou heures) de recherches sur Stackoverflow.

Le vrai soucis du code ci dessus est que `await` n'est reconnu en tant que mot-clé spécial que dans le corps d'une fonction déclarée comme `async`.
Il est donc hélas impossible de l'utiliser tel quel dans le scope principal de ce module node.

Fichtre ! Pourtant vous vous rappelez avoir prototypé votre code directement dans la console de Chrome et tout marchait comme sur des roulettes.
En effet, depuis sa [version 62][chrome], le navigateur propose ce tour de passepasse en offrant du *top level await*.
La même tentative dans le [REPL de node][repl] se serait soldée par un échec.

Comme l'explique Rich Harris, l'auteur de [rollup][rollup], introduire cette facilité au sein du système de module de node reviendrait à se tirer [une balle dans le pied][balle].

```js
async (function (exports, require, module, __filename, __dirname) {
// mon code bien au chaud avec du await top niveau
})
```

Simplement ajouter le mot clé `async` devant le wrapper *invisible* englobant chacun de nos modules node ouvrirait la porte à plus de tracas que de volupté.
(Et qui a besoin de plus de soucis de compatibilité de modules dans ces heures noires où la cohabitation entre CJS et EMS s'annonce comme douloureuse pour l'écosystème ?)

Des petits sapajous fans de *monkey patching* essaieraient presque de nous faire croire le contraire en [bidouillant `Module.wrap()`][monkey].

## IIAA ou main

Vient donc l'heure de la résignation. Si `await` nécessite une fonction `async`, créons la:

```js
const { getLastSongs } = require('./rfboCrawler')
const { logError } = require('./logger')
const count = Number(process.argv[2]) || 5

// tadaaaa
;(async () => {
try {
  let songs = await getLastSongs(count)
  songs = songs.filter(s => s.artist !== 'Jackson Five')
  console.log(`Last ${count} songs:`)
  console.table(songs)
} catch (err) {
  logError(err)
}
})()
```

Ici, c'est une *Immediately Invoked Async Arrow*, une cousine des [*IIFE*][iife] qui nous tire du pétrin.
Beaucoup de cérémonie abstraite qui ne dessert pas vraiment le code…

Soudain des vieux souvenirs des bancs de la fac ressurgissent. L'époque fougueuse où vous écrivions du C et que tous les programmes commençaient donc par:

```c
int main(int argc, char *argv[]) { /* ... */ }
```

Appliquons une formule similaire à notre JavaScript dans une ultime réécriture:


```js
const { getLastSongs } = require('./rfboCrawler')
const { logError } = require('./logger')
const count = Number(process.argv[2]) || 5

async function main () {
  let songs = await getLastSongs(count)
  songs = songs.filter(s => s.artist !== 'Jackson Five')
  console.log(`Last ${count} songs:`)
  console.table(songs)
}

// init
main().catch(logError)
```

L'appel à `main` est explicite. On profite du fait que les fonctions `async` renvoient des promesses pour retirer le `try` / `catch` et logguer l'erreur potentielle dans le cas où la promesse est rejetée.

## À venir

Les bonnes pratiques autour de `async` / `await` ne sont pas encore vraiment débroussaillées et des tas de nouveaux patterns vont certainement émerger dans les mois à venir.
Les `await` top level verront ils le jour dans le futur malgré les objections actuelles ?

En tout cas pour le moment, les plus embêtés dans cette histoire ça semble bien être les Jackson Five, qui ne sont plus *à cinq*.


[elm]: http://elm-lang.org/blog/compiler-errors-for-humans
[repl]: https://nodejs.org/api/repl.html
[chrome]: https://bugs.chromium.org/p/chromium/issues/detail?id=658558
[rollup]: https://rollupjs.org/
[balle]: https://gist.github.com/Rich-Harris/0b6f317657f5167663b493c722647221
[monkey]: https://github.com/robertklep/top-level-await
[iife]: https://developer.mozilla.org/en-US/docs/Glossary/IIFE
