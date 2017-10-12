---
title: Symbol.toPrimitive dans le module 'os' de Node
description: Coercion aux petits oignons
date: 2017-10-12
author: Bruno
tags: node
---

Depuis combien de temps n'avez vous pas éteint votre machine ?
Et si on demandait à Node.js pour voir…

Lançons un REPL:

```sh
$ node
> `Cette machine est en route depuis ${os.uptime()} secondes`
'Cette machine est en route depuis 42000 secondes'
```

On profite du fait que les modules de base soient automatiquement chargés pour s'épargner un `const os = require('os')`.
Et d'après l'API, c'est bien la *fonction* [`os.uptime()`][uptime] qui est en charge de nous renvoyer la réponse attendue.

## La coquille

On est lundi matin et dans un moment d'inattention (ou de génie), vous oubliez de taper les parenthèses d'invocation:

```sh
> `Cette machine est en route depuis ${os.uptime} secondes`
'Cette machine est en route depuis 42000 secondes'
```

Quoi ? Pas de bogue ? On récupère là aussi le bon nombre de secondes ? Tiens dont !

Histoire d'en avoir le cœur net, on peut vérifier la chose suivante:

```js
> typeof os.uptime
'function'
```

Après quelques instants d'étonnement, vous retrouvez vos esprits et vous exclamez :
"Ah bah oui, ils ont du feinter en surchargeant le `toString()` de la fonction uptime !"

```js
> os.uptime.toString()
'function getUptime() { [native code] }'
```

Fichtre, c'est pas ça. Désarroi soudain. Puis très vite, une nouvelle tentative. "Si c'est pas l'un, c'est l'autre.
C'est forcément `valueOf()` qu'ils ont du renseigner…"

```js
> os.uptime.valueOf()
{ [Function: getUptime] [Symbol(Symbol.toPrimitive)]: [Function] }
```

Encore perdu ! Sauf que cette fois ci, le pot aux roses est révélé.

## Coercion aux petits oignons

Le dernier essai s'avère plus concluant:

```js
> os.uptime[Symbol.toPrimitive]()
42000
```

Introduit en ES2015, le symbole *bien connu* (well known) `Symbol.toPrimitive`, permet d'accéder plus en profondeur à la machinerie de coercion.
Lorsque dans un expression on souhaite volontairement ou non caster un object en primitive, l'interpréteur JavaScript suit un algo bien décrit dans la spec.
Suivant les scénarios, il actionnera dans l'ordre `toString()` puis `valueOf()` ou l'inverse. ([Par ici pour les détails gores][spec]).

```js
// pseudo code
obj[Symbol.toPrimitive] = (hint) => {
  switch (hint) {
    case 'number': return  …
    break

    case 'string': return  …
    break
  }
  // hint === 'default'
  return …
}
```

La fonction ci dessus s'exécute en amont dans le processus de conversion vers une valeur primitive.
L'argument `hint` peut prendre 3 valeurs `number`, `string` ou `default`, que le moteur JS vous confiera
bien sagement suivant la manière dont vous coercer votre object: une division, une interpolation…
Dans le cas de l'opérateur `+` binaire, s'il ne peut trancher entre 'addition' ou 'concaténation', `hint` est
alors `default`.
Si les valeurs retournées par cet appel à `[Symbol.toPrimitive]()` sont cohérentes, alors on court-circuite `valueOf()` et `toString()` qu'il n'est donc pas nécessaire d'écraser.

## Et dans le vrai code ?

Allons faire un tour du coté des [sources du module `os` de Node][src], dont voici les extraits qui nous intéressent:

```js
const {
  getCPUs,
  getFreeMem,
  getHomeDirectory,
  getHostname,
  getInterfaceAddresses,
  getLoadAvg,
  getOSRelease,
  getOSType,
  getTotalMem,
  getUserInfo,
  getUptime,
  isBigEndian
} = process.binding('os');

getFreeMem[Symbol.toPrimitive] = () => getFreeMem();
getHostname[Symbol.toPrimitive] = () => getHostname();
getHomeDirectory[Symbol.toPrimitive] = () => getHomeDirectory();
getOSRelease[Symbol.toPrimitive] = () => getOSRelease();
getOSType[Symbol.toPrimitive] = () => getOSType();
getTotalMem[Symbol.toPrimitive] = () => getTotalMem();
getUptime[Symbol.toPrimitive] = () => getUptime();

module.exports = exports = {
  arch,
  cpus,
  endianness,
  freemem: getFreeMem,
  homedir: getHomeDirectory,
  hostname: getHostname,
  loadavg,
  networkInterfaces,
  platform,
  release: getOSRelease,
  tmpdir,
  totalmem: getTotalMem,
  type: getOSType,
  userInfo: getUserInfo,
  uptime: getUptime
}
```

On remarque qu'il ne se sont même pas embêter à *switcher*, se contentant de toujours retourner la même réponse peu importe le `hint`.
L'introduction de cette [astuce de siou date d'Avril 2017][issue], à partir de Node 8.x.x.
Dans le message de commit on peut y lire la motivation:

    Add Symbol.toPrimitive support to os methods that return simple
    primitives. This is a minor tweak that makes using these slightly
    more friendly when doing things like:

    var m = `${os.tmpdir}/foo`


D'après [ripgrep][ripgrep], le seul autre endroit de Node.js où ce symbole est utilisé est pour la [coercion de Buffer][buffer].

Faut il user, voire abuser de cette technique dans votre code ?
Dans un univers où les coercions implicites tordues de JavaScript sont si souvent montrées du doigt ?
A l'époque ou TypeScript ou Flow et le typage statique commencent à s'imposer ? A vous de décider…


[uptime]: https://nodejs.org/dist/latest-v8.x/docs/api/os.html#os_os_uptime
[spec]: http://www.adequatelygood.com/Object-to-Primitive-Conversions-in-JavaScript.html
[src]: https://github.com/nodejs/node/blob/master/lib/os.js
[issue]: https://github.com/nodejs/node/commit/473572ea2512cbe71e3423f8094657986352c32d
[ripgrep]: http://blog.burntsushi.net/ripgrep/
[buffer]: https://github.com/nodejs/node/blob/master/lib/buffer.js
