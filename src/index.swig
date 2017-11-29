---
title: "Développeurs JS"
description: "Développeurs JS"
menu: home
home: true
nbArticles: 4
---

<section class="banner">
	<div class="wrap">
		<div class="inner home-banner">

			<img src="img/mascot.png" alt="ByteClub mascot" class="mascot" />
			<div>
				<h1 class="page-title">ByteClub met <em>vos idées</em> en applications !</h1>

				<div class="avatars">
					<a class="avatar" href="societe.html">
						<img src="img/avatars/avatar-lilian.png" alt="Lilian Martineau" />
						<span>Bowlazed</span>
					</a>
					<a class="avatar" href="societe.html">
						<img src="img/avatars/avatar-thomas.png" alt="Thomas Moyse" />
						<span>T8G</span>
					</a>
					<a class="avatar" href="societe.html">
						<img src="img/avatars/avatar-nicolas.png" alt="Nicolas Chambrier" />
						<span>Naholyr</span>
					</a>
					<a class="avatar" href="societe.html">
						<img src="img/avatars/avatar-bruno.png" alt="Bruno Heridet" />
						<span>Delapouite</span>
					</a>
				</div>

				<p>Notre équipe accompagne vos projets JavaScript</p>
			</div>

		</div>
	</div>
</section>

<section class="section-alt">
	<div class="wrap">
		<div class="inner">

			<div class="home-technos">
				<a class="js" href="technologies.html#javascript"><img src="img/logos/javascript.svg" alt="javascript" />JavaScript</a>
				<a class="angular" href="technologies.html#angular"><img src="img/logos/angular.svg" alt="angular" />Angular</a>
				<a class="node" href="technologies.html#nodejs"><img src="img/logos/nodejs.svg" alt="nodejs" />Node.js</a>
				<a class="react" href="technologies.html#react"><img src="img/logos/reactjs.svg" alt="reactjs" />React.js</a>
			</div>

		</div>
	</div>
</section>

<section class="section">
	<div class="wrap">
		<div class="inner home-cols">

			<div class="home-col">
				<h2 class="title-main">Services</h2>

				<ul class="home-services">
					<li><a href="services.html#conseil">Conseil</a></li>
					<li><a href="services.html">Projet</a></li>
					<li><a href="services.html#formation">Formation</a></li>
					<li><a href="bootcamp.html">Bootcamp</a></li>
				</ul>
			</div>

			<div class="home-col">
				<h2 class="title-main">Projets</h2>

				<ul class="home-projects">
					<li><a href="blog/projet-copycast.html">Copycast</li>
					<li><a href="https://github.com/medialab/hyphe-browser">Hybro</a></li>
					<li><a href="https://github.com/byteclubfr/prez">Prez</li>
					<li><a href="http://www.sciencespo.fr/recherche/fr/content/les-outils-en-ligne">Isari</a></li>
				</ul>
			</div>

			<div class="home-col">
				<h2 class="title-main">Derniers articles</h2>

				<ul class="home-blog">
					{% for index, post in collections.posts %}
						{% if index < nbArticles %}
							<li>
								<a href="{{ post.url }}">{{ post.title }}</a>
								<small>{{ post.author }} le {{ post.date | date }}</small>
							</li>
						{% endif %}
					{% endfor %}
				</ul>
			</div>

		</div>
	</div>
</section>

<section class="section home-clients">
	<div class="wrap">
		<div class="inner">

			<h2 class="title-main">Clients</h2>
			<div class="home-clients-logos">
				<div><img src="/img/logos-clients/logo-m6.jpg" alt="m6" /></div>
				<div><img src="/img/logos-clients/logo-sciences-po.png" alt="sciences po" /></div>
				<div><img src="/img/logos-clients/logo-human-coders.png" alt="human coders" /></div>
				<div><img src="/img/logos-clients/logo-figaro-classifieds.jpeg" alt="figaro" /></div>
			</div>

		</div>
	</div>
</section>
