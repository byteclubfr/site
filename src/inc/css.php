<?php
/**
 * Load stylesheets in theme
 */

add_action( 'wp_enqueue_scripts', 'stp_load_css_files' );

function stp_load_css_files() {
	wp_register_style( 'site', get_template_directory_uri() . '/css/site.css', array(), '20130702', 'all' );
	wp_enqueue_style( 'site' );
}