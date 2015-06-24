---
title:
template: index.html
home: true
---

<div class="js-sticky">
  <header class="header" role="banner" id="top">
    <div class="wrap cf">
      <h1 class="logo"><img src="img/logo.png" alt="{{ site }}"/></h1>
      <nav class="wrapper-nav-main">
        <ul class="nav nav-main">
          <li class="lnk-home current"><a href="index.html"><span>Accueil</span></a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="technologies.html">Technologies</a></li>
          <li><a href="references.html">Références</a></li>
          <li><a href="societe.html">Société</a></li>
          <li><a href="contact.html">Contact</a></li>
        </ul>
      </nav>
    </div>
  </header>
</div>

<section class="banner">
  <div class="wrap cf">
    <div class="banner-home">
      <div class="banner-home-wrap">
        <h2 class="page-title">Nous mettons <em>vos idées</em> en applications&nbsp;!</h2>
        <p>{{ site }} est une Société de Services et Développement d'applications web sous Node.js et AngularJS.</p>
        <p>Nous produisons des applications connectées, frontend et backend, favorisant une expérience client toujours plus intense.</p>
        <img src="img/mascot.png" alt="" class="mascot" />
      </div>
    </div>
  </div>
</section>

<section class="section home-technos">
  <div class="wrap cf">
    <div class="inner">
      <h2 class="title-main">Nos technologies</h2>
      <div class="home-techno cf">
        <div class="home-techno-logo">
          <img src="img/logo-nodejs.jpg" alt="Node.js" />
        </div>
        <div class="home-techno-txt last">
          <p>L'API non-bloquante du framework Node.js permet d'exécuter côté serveur, des applications JavaScript avec d’excellents temps de réponse.</p>
        </div>
      </div>
      <div class="home-techno last cf">
        <div class="home-techno-logo">
          <img src="img/logo-angularjs.png" alt="AngularJS" />
        </div>
        <div class="home-techno-txt last">
          <p>AngularJS décuple les possibilités offertes par HTML5. Ce framework JavaScript permet de concevoir des applications web très riches.</p>
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
      <div class="home-service cf">
        <div class="home-service-row">
          <div class="home-service-cell">
            <div class="home-service-picto">
              <img src="img/picto-conseil.png" alt="" />
            </div>
          </div>
          <div class="home-service-cell">
            <h3 class="home-service-title">Conseil</h3>
            <div class="home-service-desc">
              <p>Faites les bons choix grâce à nos experts JavaScript.<br/>
              <a href="#">En savoir plus</a> <span>›</span></p>
            </div>
          </div>
        </div>
      </div>
      <div class="home-service cf last">
        <div class="home-service-row">
          <div class="home-service-cell">
            <div class="home-service-picto">
              <img src="img/picto-dev.png" alt="" />
            </div>
          </div>
          <div class="home-service-cell">
            <h3 class="home-service-title">Développement</h3>
            <div class="home-service-desc">
              <p>Nous mettons vos idées en applications.<br/>
              <a href="#">En savoir plus</a> <span>›</span></p>
            </div>
          </div>
        </div>
      </div>
      <div class="home-service cf">
        <div class="home-service-row">
          <div class="home-service-cell">
            <div class="home-service-picto">
              <img src="img/picto-formation.png" alt="" />
            </div>
          </div>
          <div class="home-service-cell">
            <h3 class="home-service-title">Formation</h3>
            <div class="home-service-desc">
              <p>Développez vos compétences et devenez autonome en AngularJS et Node.js.<br/>
              <a href="#">En savoir plus</a> <span>›</span></p>
            </div>
          </div>
        </div>
      </div>
      <div class="home-service cf last">
        <div class="home-service-row">
          <div class="home-service-cell">
            <div class="home-service-picto">
              <img src="img/picto-bootcamp.png" alt="" />
            </div>
          </div>
          <div class="home-service-cell">
            <h3 class="home-service-title">Bootcamp</h3>
            <div class="home-service-desc">
              <p>Développez vos compétences et devenez autonome en AngularJS et Node.js.<br/>
              <a href="#">En savoir plus</a> <span>›</span></p>
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
      <h2 class="footer-title">À propos de <strong>{{ site }}</strong></h2>
      <div class="cf">
        <div class="footer-col footer-col-lmtm">
          <div class="footer-logo">
            <img src="img/logo-white.png" alt="{{ site }}" />
          </div>
          <div class="footer-content" itemscope itemtype="http://schema.org/Corporation">
            <p><span itemprop="name">{{ site }}</span> est présent à Nantes et Lyon. Prenez rendez-vous, nous vous offrirons un café.</p>
            <p><span class="lmtm-phone" itemprop="telephone">{{ tel }}</span> <a href="mailto:{{ mailto }}" class="lmtm-email" itemprop="email">{{ mailto }}</a></p>
            <ul class="lmtm-social">
              <li class="lnk-twitter"><a href="https://twitter.com/lmtmeditions"><span>Twitter</span></a></li>
              <li class="lnk-linkedin"><a href="http://www.linkedin.com/company/lmtm-sarl"><span>LinkedIn</span></a></li>
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
