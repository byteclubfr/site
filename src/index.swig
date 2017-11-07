---
title: "ByteClub : conseil, formation et développement sous JavaScript, AngularJS, Node.js, React"
description: "ByteClub : conseil, formation et développement sous JavaScript, AngularJS, Node.js, React"
menu: home
home: true
nbArticles: 3
---
<section class="banner">
	<div class="wrap cf">
		<div class="banner-home">
			<div class="banner-home-wrap">
				<h1 class="page-title">ByteClub met <em>vos idées</em> en applications !</h1>
				<p>ByteClub conseille, forme et développe sous AngularJS, Angular, Node.js et React.</p>
				<img src="img/mascot.png" alt="" class="mascot" />
			</div>
		</div>
	</div>
</section>

<section class="section home-blog">
	<div class="wrap cf">
		<div class="inner">
			<h2 class="title-main">Nos derniers articles</h2>
			<ul>
				{% for index, post in collections.posts %}
					{% if index < nbArticles %}
						<li>
							<a href="{{ post.url }}">{{ post.title }}</a>
							<small>(par {{ post.author }} le {{ post.date | date }})</small>
						</li>
					{% endif %}
				{% endfor %}
			</ul>
			<div class="lnk-more">
				<a href="blog/index.html" title="Voir tous les articles"><span>Voir tous les articles sur le blog</span></a>
			</div>
		</div>
	</div>
</section>

<section class="section home-technos">
	<div class="wrap cf">
		<div class="inner">
			<h2 class="title-main">Nos technologies</h2>
			<div class="home-technos-list">
				<div class="home-techno">
					<div class="home-techno-logo">
						<a href="technologies.html#angularjs"><img src="img/logo-angularjs.svg" alt="AngularJS" /></a>
					</div>
					<div class="home-techno-txt">
						<p>AngularJS décuple les possibilités offertes par HTML5. Ce framework modulaire facilite la conception d'applications web riches.</p>
					</div>
				</div>
				<div class="home-techno">
					<div class="home-techno-logo">
						<a href="technologies.html#angular"><img src="img/logo-angular.svg" alt="Angular" /></a>
					</div>
					<div class="home-techno-txt">
						<p>Léger, modulaire et évolutif, Angular améliore la productivité et permet de développer des applications multiplateformes très performantes.</p>
					</div>
				</div>
				<div class="home-techno">
					<div class="home-techno-logo">
						<a href="technologies.html#nodejs"><img src="img/logo-nodejs.svg" alt="Node.js" /></a>
					</div>
					<div class="home-techno-txt">
						<p>L'API non-bloquante de Node.js permet d'exécuter côté serveur, des services JavaScript avec d’excellents temps de réponse.</p>
					</div>
				</div>
				<div class="home-techno">
					<div class="home-techno-logo">
						<a href="technologies.html#react"><img src="img/logo-react.png" alt="React" /></a>
					</div>
					<div class="home-techno-txt">
						<p>React se focalise sur la construction d'interfaces graphiques multi-supports (web et natif) référençables et aisément maintenables.</p>
					</div>
				</div>
				<div class="home-techno">
					<div class="home-techno-logo">
						<a href="technologies.html#javascript"><img src="img/logo-javascript.svg" alt="JavaScript" style="width:60px"/></a>
					</div>
					<div class="home-techno-txt">
						<p>Si l'omniprésence de JavaScript l'a rendu incontournable, c'est avant tout la souplesse de son écosystème qui a conquis les éditeurs.</p>
					</div>
				</div>
			</div>
			<div class="lnk-more lnk-technos-more">
				<a href="technologies.html" title="En savoir plus sur nos technologies"><span>En savoir plus sur nos technologies</span></a>
			</div>
		</div>
	</div>
</section>

<section class="section home-services">
	<div class="wrap">
		<div class="inner">
			<h2 class="title-main">Nos services</h2>
			<div class="home-services-list">
				<div class="home-service">
					<div class="home-service-row">
						<div class="home-service-cell">
							<div class="home-service-picto">
								<i class="fa fa-comments fa-3x"></i>
							</div>
						</div>
						<div class="home-service-cell">
							<h3 class="home-service-title">Conseil</h3>
							<div class="home-service-desc">
								<p>Faites les bons choix grâce à nos experts.<br/>
								<a href="services.html#conseil">En savoir plus</a> <span>›</span></p>
							</div>
						</div>
					</div>
				</div>
				<div class="home-service">
					<div class="home-service-row">
						<div class="home-service-cell">
							<div class="home-service-picto">
								<i class="fa fa-code fa-3x"></i>
							</div>
						</div>
						<div class="home-service-cell">
							<h3 class="home-service-title">Développement</h3>
							<div class="home-service-desc">
								<p>Mettez vos idées en applications.<br/>
								<a href="services.html#developpement">En savoir plus</a> <span>›</span></p>
							</div>
						</div>
					</div>
				</div>
				<div class="home-service">
					<div class="home-service-row">
						<div class="home-service-cell">
							<div class="home-service-picto">
								<i class="fa fa-graduation-cap fa-3x"></i>
							</div>
						</div>
						<div class="home-service-cell">
							<h3 class="home-service-title">Formation</h3>
							<div class="home-service-desc">
								<p>Enrichissez vos compétences, devenez autonome.<br/>
								<a href="services.html#formation">En savoir plus</a> <span>›</span></p>
							</div>
						</div>
					</div>
				</div>
				<div class="home-service">
					<div class="home-service-row">
						<div class="home-service-cell">
							<div class="home-service-picto">
								<i class="fa fa-rocket fa-3x"></i>
							</div>
						</div>
						<div class="home-service-cell">
							<h3 class="home-service-title">Bootcamp</h3>
							<div class="home-service-desc">
								<p>Développez votre savoir-faire et votre application.<br/>
								<a href="services.html#bootcamp">En savoir plus</a> <span>›</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="lnk-more lnk-services-more">
				<a href="services.html" title="En savoir plus sur nos services"><span>En savoir plus sur nos services</span></a>
			</div>
		</div>
	</div>
</section>

<footer class="footer footer-home" role="contentinfo">
	<div class="wrap">
		<div class="inner">
			<h2 class="footer-title">À propos de <strong>ByteClub</strong></h2>
			<div class="footer-cols">
				<div class="footer-col footer-col-byteclub">
					<div class="footer-logo">
						<img src="img/logo-white.png" alt="ByteClub" />
					</div>
					<div class="footer-content" itemscope itemtype="http://schema.org/Corporation">
						<p><span itemprop="name">ByteClub</span> est présent à Nantes et Lyon. Venez prendre un café, avec ou sans rendez-vous.</p>
						<p><span class="byteclub-phone" itemprop="telephone"><i class="fa fa-phone"></i>06 14 66 76 41</span> <a href="mailto:contact@byteclub.fr" class="byteclub-email" itemprop="email"><i class="fa fa-envelope"></i>contact@byteclub.fr</a></p>
						<ul class="byteclub-social">
							<li><a href="https://twitter.com/byteclubfr"><i class="fa fa-twitter fa-2x"></i><span>Twitter</span></a></li>
							<li><a href="https://github.com/byteclubfr"><i class="fa fa-github fa-2x"></i><span>GitHub</span></a></li>
						</ul>
					</div>
				</div>
				<div class="footer-col footer-col-ooz">
					<div class="footer-logo">
						<img src="img/logo-ooz.png" alt="OOZ.io" />
					</div>
					<div class="footer-content">
						<p>(Re)Communiquez avec vos clients. Application web pour une communication B2B dynamique.</p>
						<p><strong>Vous souhaitez en savoir plus&nbsp;?<br/> <a href="contact.html">Contactez-nous&nbsp;!</a></strong></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
