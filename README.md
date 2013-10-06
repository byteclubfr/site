# CSS

Les feuilles de styles sont codées avec le préprocesseur [SASS](http://sass-lang.com/), accompagné des librairies [Compass](http://compass-style.org/) et [Susy](http://susy.oddbird.net/).
Pour installer ces outils:

```sh
$ gem install sass
$ gem install compass
$ gem install susy
```

Pour lancer la génération automatique de la feuille de style, il suffit de se placer à la racine du projet et lancer la commande:

```sh
compass watch
```

Ainsi, à chaque modification d'un fichier SASS, la feuille de style sera regénérée automatiquement (en l'occurrence, _site.css_).

# Fonts

Les polices embarquées sur le site utilisent le service [Typekit](https://typekit.com). Pour le moment, c'est mon compte qui est utilisé. Il est configuré pour être utilisé sur les domaines suivants:

	localhost (pour que les polices s'affichent en local)
	lmtm.fr

Si vous préférez être autonome sur la gestion des polices, il suffit de créer un compte Typekit ([formule Portefeuille](https://typekit.com/plans), 49.99$/an) et suivre les étapes suivantes:

* Créer un nouveau kit
* Ajouter le code JS donné dans la partie `<head>` (et donc supprimer le mien)
* Choisir les polices à ajouter dans le kit. En l'occurence: **Proxima Nova** (Light, Regular, Bold), **Adelle** (Light, Light Italic, Regular, Semibold)
* Publier le kit

# Map

La carte sur la page Contact est générée avec la librairie [Leaflet](http://leafletjs.com/).

La partie graphique est générée grâce au service CloudMade. L'utilisation de ce service se fait grâce à une clé d'API.

Si vous souhaitez utiliser votre propre clé d'API, il suffit de [créer un compte CloudMade](http://account.cloudmade.com/register) et mettre à jour la clé. Celle-ci se situe à la ligne 87 dans le fichier js/start.js:

	L.tileLayer('http://{s}.tile.cloudmade.com/API-key/109881/256/{z}/{x}/{y}.png',
