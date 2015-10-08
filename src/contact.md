---
title: Contact
description: "Contactez ByteClub."
template: index.html
scripts:
  - "js/leaflet.js"
  - "js/parsley.min.js"
  - "https://cdn.firebase.com/v0/firebase.js"
---
<div class="js-sticky">
	<header class="header" role="banner" id="top">
		<div class="wrap cf">
			<div class="logo"><a href="index.html" title="Retour à l'accueil"><img src="img/logo-byteclub.png" alt="ByteClub"/></a></div>
			<nav class="wrapper-nav-main">
				<ul class="nav nav-main">
					<li class="lnk-home"><a href="index.html"><span>Accueil</span></a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="technologies.html">Technologies</a></li>
					<li><a href="references.html">Références</a></li>
					<li><a href="societe.html">Société</a></li>
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
		</div>
	</div>
</section>

<section class="section-alt">
	<div class="wrap cf">
		<div class="inner">
			<div class="contact-form">
				<p>N'hésitez pas à venir nous rencontrer si vous êtes sur Nantes ou Lyon !</p>
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
				<p><img src="img/logo-byteclub-tiny.png" alt="ByteClub" />
					<img src="img/mascot-byteclub-medaillon-tiny.png" alt="MascotByteClub" /><br/>
				5, Boulevard Vincent Gache<br/>
				44200 Nantes</p>
				<p class="tel-mail"><a href="mailto:contact@byteclub.fr">contact@byteclub.fr</a><br/>
				<span class="tel">06 14 66 76 41</span></p>
			</div>
		</div>

	</div>
</section>
