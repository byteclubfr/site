---
title: "Robin en stage au ByteClub"
description: "La page de Robin Mabit, stage de 3eme"
---

<style>
	.robin-section {
		margin: 2em 0;
		padding: 2em;
		border: 1px solid #ddd;
		box-shadow: 10px 10px 5px -4px #ddd;
		background-color: #fefefe;
		clear: both;
	}
	.robin-section:first-of-type {
		min-height: 160px;
	}
	.robin-nav {
		float: right;
	}
	table.robin-sound {
		border-collapse: collapse;
		margin: 50px;
	}
	table.robin-sound td {
		padding: .5em;
	}
	table.robin-sound td button {
		font-size: 1.4em;
	}
</style>

<section>

	<div class="wrap cf">

		<div class="inner">

			<div class="robin-section">
				<nav class="robin-nav">
					<ul>
						<li><a href="#presentation">Présentation</a></li>
						<li><a href="#lundi">Lundi</a></li>
						<li><a href="#mardi">Mardi</a></li>
						<li><a href="#mercredi">Mercredi</a></li>
						<li><a href="#jeudi">Jeudi</a></li>
						<li><a href="#vendredi">Vendredi</a></li>
						<li><a href="#soundbox">Soundbox</a></li>
					</ul>
				</nav>

				<h2>Bonjour, je suis Robin.</h2>

				<p>Je suis en stage de 3eme au <img src="img/logo-byteclub-tiny.png" style="vertical-align: middle;height:1.5em;">.</p>
				<p>Voici le compte rendu de ma semaine passée dans cette société.</p>

			</div>

			<div id="presentation" class="robin-section">
				<h2>Présentation de la société</h2>

				<h3>Son histoire</h3>
				<p>L'entreprise s'est formée le 13 février 2013. Au depart elle s'appelait LMTM (Lilian Martineau, Thomas Moyse) mais elle à décidé par la suite de se faire appeler ByteClub.</p>

				<h3>Ses activités</h3>
				<p>L'entreprise :</p>
				<ul>
					<li> Développe des applications. </li>
					<li> Propose des formation JavaScript de remise à niveau ainsi qu'une formation ECMAScript. </li>
					<li> Edite des logiciels. </li>
				
				<h3>Son organisation</h3>
				<p>C'est une petite entreprise (4 personnes y travaillent).
				Ils ont tous un poste différent.</p>

				<h3>Les bureaux</h3>
				<p>Le bureau se trouve à Nantes  (Place Sophie Trebuchet) ,
				mais deux des quatres personnes travaillent depuis chez eux , à Lyon</p>
				<img src="img/photostage.jpg" style="">

				<h3>Les gens</h3>
				<p>Thomas Moyse : Expert AngularJS, développeur, formateur.</p>
				<p>Lilian Martineau : Gestionnaire, commercial.</p>
				<p>Nicolas Chambrier : Expert Node.js, développeur, formateur.</p>
				<p>Bruno Heridet : Expert AngularJS et Node.js, développeur, formateur.</p>

			</div>

			<div id="lundi" class="robin-section">
				<h2>Lundi</h2>

				<p>Je me suis familliarisé avec les outils principaux d'un developpeur. J'ai installé un environnement de travail. Ma mission pour la semaine est de modifier le site internet de l'entreprise (onglet techno angular2) et de créer une page cachée parlant de mon stage . Pour cela je vais avoir besoin d'utiliser des logiciels de développement.</p>

				<h3>1. Inscription à GitHub</h3>
				<p>Mon comte : https://github.com/robinmabit</p>

				<h3>2. Installation de GitGub</h3>
				<p>GitHub est un site où n'importe qui peut créer et présenter sont travail. </p>

				<h3>3. Installation de NodeJS et de npm</h3>
				<p>NodeJS et npm sont des outils du développeur.

				<h3>4. Installation de Sulime Text 3</h3>
				<p>Sublime Text est un éditeur de texte pour modifier les sources d'une application.</p>
		
			
			</div>

			<div id="mardi" class="robin-section">
				<h2>Mardi</h2>

				<p>J'ai commencé la page cachée de mon stage sur le site de l'entreprise. Ajout de la rubrique Angular dans la page "Nos Technologie". Inversion du logo Angular pour le logo AngularJS.</p>

			</div>

			<div id="mercredi" class="robin-section">
				<h2>Mercredi</h2>

				<p>Continuation de ma page cachée.</p>
			</div>

			<div id="jeudi" class="robin-section">
				<h2>Jeudi</h2>

				<p>Ajout de la rubrique Angular dans la page "Nos Services" du site de l'entreprise. Changement du logo Angular sur la page formations-angularjs.</p>

			</div>

			<div id="vendredi" class="robin-section">
				<h2>Vendredi</h2>

				<p>Finition de ma page cachée. Ajout du texte dans la rubrique Formation Angular sur le site de l'entreprise.</p>

			</div>

			
			<div id="soundbox" class="robin-section">
				<h2>SoundBox</h2>
				<table class="robin-sound">
					<tr>
						<td><button onclick="parle('sf_pet_13')">prout</button></td>			
						<td><button onclick="parle('sf_laser_15')">laser</button></td>
						<td><button onclick="parle('madgiggle')">ricanement</button></td>
					</tr>
					<tr>
						<td><button onclick="parle('Rire du Diable')">Rire du Diable</button></td>	 <td><button onclick="parle('Monstre')">Monstre</button></td>
						<td><button onclick="parle('Porte qui grince')">Porte qui grince</button></td>
					</tr>
				</table>
			</div>

		</div>

	</div>

</section>

<script>

function parle(sound) {
	var audio = new Audio("sounds/" + sound + ".mp3")
	audio.play()
}

</script>