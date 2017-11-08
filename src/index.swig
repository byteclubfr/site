---
title: "Développeurs JS"
description: "Développeurs JS"
menu: home
home: true
nbArticles: 4
---
<section class="banner">
	<div class="wrap">
		<div class="inner banner-home">
			<img src="img/mascot.png" alt="ByteClub mascot" class="mascot" />
			<div>
				<h1 class="page-title">ByteClub met <em>vos idées</em> en applications !</h1>

				<div class="avatars">
					<div class="avatar">
						<img src="img/avatars/avatar-thomas.png" alt="Thomas Moyse" />
						<span>T8G</span>
					</div>
					<div class="avatar">
						<img src="img/avatars/avatar-lilian.png" alt="Lilian Martineau" />
						<span>Bowlazed</span>
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

<section class="section home-technos">
	<div class="wrap cf">
		<div class="inner">
			<div class="home-technos-list">

				<div class="home-techno">
					<h2 class="title-main">Nos technos</h2>
					<ul class="logos-techno">
						<li><img class="logo-techno" src="img/logos/javascript.svg" alt="javascript" /> JavaScript</li>
						<li><img class="logo-techno" src="img/logos/nodejs.svg" alt="nodejs" /> Node.js</li>
						<li><img class="logo-techno" src="img/logos/reactjs.svg" alt="reactjs" /> React.js</li>
						<li><img class="logo-techno" src="img/logos/angular.svg" alt="angular" /> Angular</li>
					</ul>
				</div>

				<div class="home-techno">
					<h2 class="title-main">Nos projets</h2>
					<ul class="logos-techno">
						<li><img class="logo-techno" src="img/logos/github.svg" alt="copycast" /> Copycast</li>
						<li><img class="logo-techno" src="img/logos/hyphe.svg" alt="hybro" /> Hybro</li>
						<li><img class="logo-techno" src="img/logos/gitlab.svg" alt="prez" /> Prez</li>
						<li><img class="logo-techno" src="img/logos/tiger-head.svg" alt="isari" /> Isari</li>
					</ul>
				</div>

				<div class="home-techno">
					<h2 class="title-main">Nos derniers articles</h2>
					<ul class="last-blog-articles">
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
							<h3 class="home-service-title">Projets</h3>
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
