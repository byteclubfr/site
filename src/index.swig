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
					<div class="avatar">
						<img src="img/avatars/avatar-lilian.png" alt="Lilian Martineau" />
						<span>Bowlazed</span>
					</div>
					<div class="avatar">
						<img src="img/avatars/avatar-thomas.png" alt="Thomas Moyse" />
						<span>T8G</span>
					</div>
					<div class="avatar">
						<img src="img/avatars/avatar-nicolas.png" alt="Nicolas Chambrier" />
						<span>Naholyr</span>
					</div>
					<div class="avatar">
						<img src="img/avatars/avatar-bruno.png" alt="Bruno Heridet" />
						<span>Delapouite</span>
					</div>
				</div>

				<p>Notre équipe accompagne vos projets JavaScript</p>
			</div>

		</div>
	</div>
</section>

<section class="section">
	<div class="wrap">
		<div class="inner">

			<div class="home-technos">
				<div class="js"><img src="img/logos/javascript.svg" alt="javascript" /> JavaScript</div>
				<div class="angular"><img src="img/logos/angular.svg" alt="angular" /> Angular</div>
				<div class="node"><img src="img/logos/nodejs.svg" alt="nodejs" /> Node.js</div>
				<div class="react"><img src="img/logos/reactjs.svg" alt="reactjs" /> React.js</div>
			</div>

		</div>
	</div>
</div>

<section class="section">
	<div class="wrap">
		<div class="inner home-cols">

			<div class="home-col">
				<h2 class="title-main">Nos services</h2>

				<ul class="home-services">
					<li>Conseil</li>
					<li>Projets</li>
					<li>Formation</li>
					<li>Bootcamp</li>
				</ul>
			</div>

			<div class="home-col">
				<h2 class="title-main">Nos projets</h2>

				<ul class="home-projects">
					<li><img src="img/logos/github.svg" alt="copycast" /> Copycast</li>
					<li><img src="img/logos/hyphe.svg" alt="hybro" /> Hybro</li>
					<li><img src="img/logos/gitlab.svg" alt="prez" /> Prez</li>
					<li><img src="img/logos/tiger-head.svg" alt="isari" /> Isari</li>
				</ul>
			</div>

			<div class="home-col">
				<h2 class="title-main">Nos derniers articles</h2>

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

			<h2 class="title-main">Nos clients</h2>
			<div class="home-clients-logos">
				<div><img src="/img/logos-clients/logo-m6.jpg" alt="m6" /></div>
				<div><img src="/img/logos-clients/logo-sciences-po.png" alt="sciences po" /></div>
				<div><img src="/img/logos-clients/logo-human-coders.png" alt="human coders" /></div>
			</div>

		</div>
	</div>
</section>
