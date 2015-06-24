---
title: Contact
template: index.html
scripts:
  - "js/parsley.min.js"
  - "https://cdn.firebase.com/v0/firebase.js"
---

<div class="js-sticky">
	<header class="header" role="banner" id="top">
		<div class="wrap cf">
			<div class="logo">
				<img src="img/logo.png" alt="{{ site }}" />
			</div>
			<nav class="wrapper-nav-main">
				<ul class="nav nav-main">
					<li class="lnk-home"><a href="index.html"><span>Accueil</span></a></li>
					<li>
						<a href="services.html">Services</a>
						<ul class="nav nav-sub">
							<li><a href="#conseil">Conseil</a></li>
							<li><a href="#developpement">Développement</a></li>
							<li><a href="#formation-nodejs">Formation Node.js</a></li>
							<li><a href="#formation-angularjs">Formation AngularJS</a></li>
						</ul>
					</li>
					<li>
						<a href="technologies.html">Technologies</a>
						<ul class="nav nav-sub">
							<li><a href="#nodejs">Node.js</a></li>
							<li><a href="#angularjs">AngularJS</a></li>
						</ul>
					</li>
					<li><a href="references.html">Références</a></li>
					<li>
						<a href="societe.html">Société</a>
						<ul class="nav nav-sub">
							<li><a href="#equipe">Équipe</a></li>
							<li><a href="#philosophie">Philosophie</a></li>
						</ul>
					</li>
					<li class="current"><a href="contact.html">Contact</a></li>
				</ul>
			</nav>
		</div>
	</header>
</div>

<section class="banner">
	<div class="wrap cf">
		<div class="inner">
			<h1 class="page-title">Contactez-nous</h1>
			<div class="banner-text">
				<p>Prenez rendez-vous, nous vous offrirons un café.</p>
			</div>
		</div>
	</div>
</section>

<section class="section-alt">
	<div class="wrap cf">
		<div class="inner">
			<div class="contact-form">
				<p class="fields-required">Les champs marqués d’un astérisque (<span>*</span>) sont obligatoires.</p>
				<form id="contact" data-validate="parsley" data-show-errors="false">

					<p class="form-notice form-notice-error">
						Désolé, le formulaire comporte des erreurs.<br/> Veuillez corriger votre message et l'envoyer à nouveau.
					</p>

					<p class="form-notice form-notice-success">
						Votre message a bien été envoyé.<br/> Nous vous contacterons dans les plus brefs délais.
					</p>

					<div class="field form-half">
						<label for="name">Nom</label>
						<input type="text" class="input" id="lastname" />
					</div>
					<div class="field form-half last">
						<label for="firstname">Prénom</label>
						<input type="text" class="input" id="firstname" />
					</div>
					<div class="field">
						<label for="email">Adresse email <span class="required">*</span></label>
						<input type="text" class="input" id="email" data-required="true" data-type="email" />
					</div>
					<div class="field">
						<label for="email">Société</label>
						<input type="text" class="input" id="company" />
					</div>
					<div class="field">
						<label for="message">Message <span class="required">*</span></label>
						<textarea class="input" id="message" data-required="true"></textarea>
					</div>
					<div class="field field-submit">
						<button type="submit" class="btn">Envoyer votre message</button>
					</div>
				</form>
			</div>
			<div id="contact-map"></div>
			<div id="map-popup">
				<p><img src="img/logo-lmtm-tiny.png" alt="{{ site }}" /><br/>
				5, Boulevard Vincent Gache<br/>
				44200 Nantes</p>
				<p class="tel-mail"><a href="mailto:{{ mailto }}">{{ mailto }}</a><br/>
				<span class="tel">{{ tel }}</span></p>
			</div>
		</div>
	</div>
</section>

<script>
$('#contact').submit(function(e) {

	e.preventDefault();

	if ($(this).parsley('isValid')) {
		$('.form-notice-error').hide();

		var ref = new Firebase('https://lmtm.firebaseio.com/lmtm');
		ref.push({
			'email': $('#email').val(),
			'lastname': $('#lastname').val(),
			'firstname': $('#firstname').val(),
			'company': $('#company').val(),
			'message': $('#message').val()
		}, function(err) {
			if (err) alert("Une erreur est survenue, nous sommes désolé, nous n'avons pas pu enregistrer votre message.");
			else $('.form-notice-success').show();
		});

	} else {
		$(this).find('.input.parsley-validated').each(function(i, input) {
			if (!$(input).parsley('validate')) {
				$(input).parent('.field').addClass('field-error');
			} else {
				$(input).parent('.field').removeClass('field-error');
			}
		});
		$('.form-notice-error').show();
	}

});
</script>
