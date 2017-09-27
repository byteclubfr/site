---
title: React Portals
description: Entrez dans la 4ème DOMension 
date: 2017-09-27
author: Bruno
---

[React 16][1] vient de pointer le bout de son nez.
Parmi les nouveautés, l'introduction de l'API `React.createPortal` qui comme son nom l'indique
permet de créer des portails.


## Portail ?

Pour comprendre cette notion, rien de mieux que de faire un saut vers l'univers où ce mot a été emprunté.

Dans ce contexte il ne fait pas allusion au portillon en fer forgé de votre maison de vacances à St Brévin,
mais plutôt au *trou de ver*, ce tunnel de téléportation dont la science-fiction s'est maintes fois inspirée
comme par exemple dans le bien nommé [Portal de Valve][2].

![Shell through portals](/img/blog/react-portal/shell.jpg)

Dessin de [everyredqueen](https://www.deviantart.com/art/portals-297120453)

Ici, on cerne direct qu'un portail nous permet d'interagir avec un *lieu* distant, déconnecté, de manière transparente.
Et dans le cadre d'un arbre React, ça se traduit par un autre endroit du DOM, indépendant de la branche dans laquelle
se situe le composant où le portail s'ouvre.


## A bas la hiérarchie

Comme ses frameworks confrères, React est tout à fait capable de prendre le contrôle de tout un document
et ainsi de permettre l'élaboration d'une *Single Page Application*:

```js
React.render(<App />, document.body)
```

Mais attention, ne faites pas ça chez vous ! Se brancher directement sur `document.body` est vivement déconseillé :
cela rend la cohabitation assez difficile avec des scripts tiers qui ont tendance à organiser un joyeuse fiesta dans `<body>`.

La bonne pratique veut donc que l'on greffe la racine de notre arbre de composants sur un élément dédié à l'ancrage, du style `<div id="mount"></div>`.
Et c'est là que React se distingue d'approches telles que promues par AngularJS. Dans ce dernier, il n'est pas vraiment commun de faire cohabiter plusieurs
applications sur une même page. La directive `ng-app` est unique et il faut passer par un appel explicite à `angular.bootstrap` pour éventuellement bâtir d'autres
applications.

A l'inverse, il est tout en fait envisageable de faire plusieurs appels à `React.render()` en spécifiant à chaque fois un nouveau point de montage.
En adoptant cette technique, on se rapproche plus d'une construction où plusieurs *widgets* (color-picker, calendrier…) viennent agrémenter un existant.
C'est particulièrement pratique pour une migration en douceur, où au fil des semaines une page statique peut prendre vie jusqu'à peut être un jour devenir une application complète.

## Si près mais si loin en même temps…

```html
<div id="color-picker"></div>
<main>Message super important</main>
<div id="calendar"></div>
```

```js
React.render(<ColorPicker />, document.getElementById('color-picker'))
React.render(<Calendar />, document.getElementById('calendar'))
```

[Les lundis sont bleus][3]. Donc, partant du code si dessus, si l'utilisateur en choisit un dans le calendrier, comment s'assurer que la palette blémisse d'une teinte azure ?
Chaque composant encapsule son état et la discussion classique via propagation des *props* est un cul de sac puisqu'ils n'ont pas d'ancêtre commun.

Qu'à cela ne tienne, regroupons ces orphelins au sein d'un nouveau composant `<App />`, qui fera office de facilitateur !
Hélas, des contraintes métiers exotiques vous impose de laisser l'élément `<main>` tranquille, hors d'atteinte de React, pour des besoins de référencement par exemple.
(Dans ce cas fictif, on exclut le salut qu'offrirait un quelconque pré-rendu de l'arbre React coté serveur. Pour mettre fin à cette pulsion, imaginez que c'est un bon vieux [SPIP][4] qui se charge du templating).

## Papotage entre frérots

Quelle stratégie mettre en place dès lors pour rétablir la communication ?

Nous pourrions utilser un [EventEmitter][5] global.
Chaque composant intéressé par une info pourrait souscrire aux canaux qui le motivent, en s'y branchant dans son `componentDidMount`,
puis émettre à son bon vouloir dans ce bus commun. Si ce stratagème vous évoque quelque chose, ce n'est pas un hasard. Un portail ? Non pas encore.

Dans ce cas de figure, [redux][6] peut nous sortir d'affaire. Puisque son `store` unique peut justement faire office de point de rencontre.
Pour redistribuer les données, le *provider* fournit par [react-redux][7] facilite la tâche:

```js
const store = createStore(…)

React.render(
  <Provider store={store}><ColorPicker /></Provider>,
  document.getElementById('color-picker'))
React.render(
  <Provider store={store}><Calendar /></Provider>,
  document.getElementById('calendar'))
```

Ok, donc si ce problème est résolu, quel bénéfice apporte les portails ?

## QuasiModal

Le concept de portail apparait *officiellement* dans l'API, mais son utilisation n'est pas nouvelle comme en témoigne plusieurs [démonstrations de Ryan Florence][8]
ou des projets dédiés comme [react-portal][9].

Le cas d'utilisation classique (celui repris dans la [doc consacrée][10] par ailleurs) est l'installation d'une bien jolie *modal* pilotée par React.
D'autres éléments d'interfaces rentrent aussi dans cette catégorie, comme les barres de chargement, les infobulles, les *lightboxes*…
Ils ont commun de nécessiter une certaine indépendance vis à vis des autres.
Une modal ne souhaite pas vraiment être en proie au effet de bord de la *cascade des styles*
si son élément parent venait sournoisement mettre en péril son précieux positionnement, la taille de son texte, sa visibilité…

Pour garantir son émancipation, elle a donc tout intérêt à s'échapper et venir se greffer hors d'atteinte, dans un point de montage bien au chaud dans `<body>`
Si cet éloignement de la hiérarchie est bien pratique coté rendu, coté code il serait pourtant bien pratique de pouvoir malgré tout continuer à déclarer notre
élément `<Modal />` à un emplacement plus *logique*. A coté de son bouton d'ouverture notamment.

C'est justement le tour de passe-passe offert par les portails.


## Téléarboriculture

![Portal xmas tree](/img/blog/react-portal/portal-tree.jpg)

Noël décapité chez [Kevin James Hunt](http://kevinjameshunt.com/diy-projects/how-to-build-your-own-portal-christmas-tree/)

Les portails apportent une solution alternative à celle à base de multi `<Provider />` décrite plus haut.
L'arbre de composants devient décorrelé de l'arbre généré dans le DOM.

```js
<div id="mount-loading"></div>
<div id="mount-app"></div>
```

```js
const h = React.createElement

const appMount = document.getElementById('mount-app')
const loadingMount = document.getElementById('mount-loading')

class Loading extends React.Component {
  render() {
    const style = {
      position: 'absolute',
      top: 0,
      height: '20px',
      width: '90%',
    }
    return ReactDOM.createPortal(
      h('progress', {
        style,
        value: this.props.progress,
        max: 200,
      }),
      loadingMount,
    )
  }
}

class App extends React.Component {
  constructor(...args) {
    super(...args)
    this.state = {progress: 0}
    this.onMouseMove = this.onMouseMove.bind(this)
  }

  onMouseMove() {
    this.setState(({ progress }) => ({
      progress: progress + 1
    }))
  }

  render() {
    const style = {
      background: 'hotpink',
      marginTop: '20px',
    }
    return (
      h('div', { style, onMouseMove: this.onMouseMove },
        h(Loading, { progress: this.state.progress }),
        h('p', null, `Progress ${this.state.progress}`)),
    )
  }
}

ReactDOM.render(h(App), appMount)
```

Ce [morceau de code][11] présente deux composants React. `<Loading>` a pour vocation d'afficher
en haut de l'écran une barre de chargement comme c'est le cas lorsque l'on navigue sur GitHub.

Lorsque React l'exécute et que l'on inspecte le DOM chacun des éléments est bien indépendant dans son point de montage.
Ils ne sont donc ni imbriqués, ni superposés grâce aux marges et positionnement absolu.

Pourtant l'évènement `mouseMove` est bien déclenché, que l'on survole le `<div>` symbolisant `<App>`
ou le `<progress>`, symbolisant `<Loading>`. L'ébullition (*bubbling*) se propage donc bien dans l'arbre de composants.

Les composants peuvent discuter via `props` et `callbacks`, comme toujours.
Si le `context` React avait été utilisé, le lien parent<>enfant serait là aussi resté actif.

Ces propriétés permettent d'aboutir à des mariages intéressants comme réutiliser des widgets d'autres écosystèmes comme une modal jQuery (ou MooTools) sans tout bouleverser.


## L'horizon des évènements

Dur de prédire à l'heure actuelle les multiples possibilités (ou dérives) restant à expérimenter avec les portails.
Les vortex de JavaScript ne vont pas tarder à nous aspirer. Explorons ensemble !

![Sliders](/img/blog/react-portal/slider.gif)

[1]: https://facebook.github.io/react/blog/2017/09/26/react-v16.0.html
[2]: http://store.steampowered.com/app/400/Portal/
[3]: https://www.youtube.com/watch?v=FYH8DsU2WCk
[4]: https://www.spip.net/
[5]: https://nodejs.org/api/events.html#events_class_eventemitter
[6]: http://redux.js.org/
[7]: https://github.com/reactjs/react-redux/blob/master/docs/api.md#provider-store
[8]: https://www.youtube.com/watch?v=z5e7kWSHWTg&feature=youtu.be&t=15m17s
[9]: https://github.com/tajo/react-portal
[10]: https://facebook.github.io/react/docs/portals.html
[11]: http://jsbin.com/terahinupo/edit?html,js,output
