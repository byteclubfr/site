<?php
/**
 * Load JS scripts in theme
 */
 
add_action( 'wp_enqueue_scripts', 'stp_load_js_files' );

function stp_load_js_files() {
	wp_register_script( 'fancybox', get_template_directory_uri() . '/js/jquery.fancybox.pack.js', array('jquery'), '2.1.5', true );
	wp_register_script( 'smoothscroll', get_template_directory_uri() . '/js/jquery.smooth-scroll.min.js', array('jquery'), '1.4.10', true );
	wp_register_script( 'modernizr', get_template_directory_uri() . '/js/modernizr.custom.22896.js', array(), '2.6.2', true );
	wp_register_script( 'start', get_template_directory_uri() . '/js/start.js', array('fancybox','smoothscroll'), '20130702', true );
	wp_enqueue_script( 'fancybox' );
	wp_enqueue_script( 'smoothscroll' );
	wp_enqueue_script( 'modernizr' );
	wp_enqueue_script( 'start' );
}