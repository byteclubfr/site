/*
    START
    Load JS plugins and various functions
*/

// Initialize
bc = {};

// Starting functions
$(document).ready(function(){
	bc.scrollToAnchor('.js-backToTop');
	bc.scrollToAnchor('.nav-sub a', -100);
	bc.mobileMenu('.wrapper-nav-main');
	bc.map('#contact-map');
	bc.dispatchBlocks('.js-dispatch');
	bc.hoverCard('.idea');
	bc.toggleReference('.reference-btn');
	// On resize events
	$(window).bind("debouncedresize", function() {
		bc.dispatchBlocks('.js-dispatch');
	});
	bc.stickyNav('.js-sticky');
});

// Scroll to top
bc.scrollToAnchor = function(selector, offset){
	if(!$(selector).length) return;
	$(selector).smoothScroll({
    offset: offset || 0,
		speed: 1000
	});
}

// Mobile nav menu
bc.mobileMenu = function(selector){
	if(!$(selector).length) return;
	$(selector).meanmenu({
		meanScreenWidth: '680',
		meanMenuContainer: '.banner',
		meanShowChildren: false
	});
}

// Sticky nav
bc.stickyNav = function(selector){
	if(!$(selector).length) return;
	$(selector).sticky({
		'offset' : 0,
    'onStart' : function(){
      $('.jquery-sticky-placeholder').height($(selector).height());
    }
	});
}

// Dispatch services blocks on two columns
bc.dispatchBlocks = function(selector){
	if(!$(selector).length) return;
	var container = $('.blocks');
	// On large screens, we dispatch blocks on two columns
	if(Modernizr.mq('(min-width: 80em)') && container.not('.is-dispatched') ){
		$(".block-odd").each(function() {
	  		$(this).appendTo('.blocks-col-left');
		});
		$(".block-even").each(function() {
	  		$(this).appendTo('.blocks-col-right');
		});
		container.addClass('is-dispatched');
	}
	// On smal screens, we reorder blocks and display them on one column
	if(Modernizr.mq('(max-width: 80em)') && container.hasClass('is-dispatched') ){
		$('.block').sort(function(a,b){
   			return a.dataset.order > b.dataset.order
		}).appendTo(container);
	}
}

// Map on contact page
bc.map = function(selector){
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
bc.hoverCard = function(selector){
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

// Toggle reference content display
bc.toggleReference = function(selector){
	if(!$(selector).length) return;
	$(selector).click(function(){
		var that = $(this);
		var parent = that.parent();
		parent.find('.reference-content').slideToggle(400, function(){
			parent.toggleClass('is-open');
			if ( parent.hasClass('is-open') ) {
				that.text('-');
			} else {
				that.text('+');
			}
		});
	});
}