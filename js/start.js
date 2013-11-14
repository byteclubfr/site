/*
    START
    Load JS plugins and various functions
*/

// Initialize
lmtm = {};

// Starting functions
$(document).ready(function(){
	lmtm.scrollToAnchor('.js-backToTop');
	lmtm.scrollToAnchor('.nav-sub a', -100);
	lmtm.mobileMenu('.wrapper-nav-main');
	lmtm.map('#contact-map');
	lmtm.dispatchServices('.service');
	lmtm.hoverCard('.idea');
	// On resize events
	$(window).bind("debouncedresize", function() {
		lmtm.dispatchServices('.service');
	});
  lmtm.stickyNav('.js-sticky');
});

// Scroll to top
lmtm.scrollToAnchor = function(selector, offset){
	if(!$(selector).length) return;
	$(selector).smoothScroll({
    offset: offset || 0,
		speed: 1000
	});
}

// Mobile nav menu
lmtm.mobileMenu = function(selector){
	if(!$(selector).length) return;
	$(selector).meanmenu({
		meanScreenWidth: '680',
		meanMenuContainer: '.banner',
		meanShowChildren: false
	});
}

// Sticky nav
lmtm.stickyNav = function(selector){
	if(!$(selector).length) return;
	$(selector).sticky({
		'offset' : 0,
    'onStart' : function(){
      $('.jquery-sticky-placeholder').height($(selector).height());
    }
	});
}

// Dispatch services blocks on two columns
lmtm.dispatchServices = function(selector){
	if(!$(selector).length) return;
	var container = $('.services');
	// On large screens, we dispatch blocks on two columns
	if(Modernizr.mq('(min-width: 80em)') && container.not('.is-dispatched') ){
		$(".service-odd").each(function() {
	  		$(this).appendTo('.services-col-left');
		});
		$(".service-even").each(function() {
	  		$(this).appendTo('.services-col-right');
		});
		container.addClass('is-dispatched');
	}
	// On smal screens, we reorder blocks and display them on one column
	if(Modernizr.mq('(max-width: 80em)') && container.hasClass('is-dispatched') ){
		$('.service').sort(function(a,b){
   			return a.dataset.order > b.dataset.order
		}).appendTo(container);
	}
}

// Map on contact page
lmtm.map = function(selector){
	if(!$(selector).length) return;
	var contact_details = $('#map-popup');
	contact_details.hide();
	var map = L.map(
        'contact-map',
        {
            scrollWheelZoom : false,
            closePopupOnClick: false,
            zoomControl: false
        })
		.setView([47.208784, -1.552565], 14);

	new L.Control.Zoom({ position: 'topright' }).addTo(map);

    L.tileLayer('http://{s}.tile.cloudmade.com/edafc14b9dd8462e904fcefbf1c97535/109881/256/{z}/{x}/{y}.png',
        {
            maxZoom: 18
        })
        .addTo(map);

    // Add the marker and its popup
    var popup = L.popup(
        {
            closeButton: false
        })
        .setLatLng([47.207005, -1.552673])
        .setContent(contact_details.html())
        .openOn(map);
}

// Hover effect on philosophy cards
lmtm.hoverCard = function(selector){
	if(!$(selector).length) return;
	$('.idea-card').append('<span class="idea-close"></span>');
	$('.idea-front').append('<span class="idea-open"></span>');
	$('.idea-open').click(function(){
        $(this).parent('.idea-front').fadeTo( 'fast', 0 );
    });
    $('.idea-close').click(function(){
        $(this).prevAll('.idea-front').fadeTo( 'fast', 1 );
    });
}