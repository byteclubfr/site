<?php
/**
 * Customize the WordPress administration
 */

// Remove meta boxes
function stp_remove_post_meta_boxes() {
	remove_meta_box( 'commentsdiv', 'post', 'normal' );
	remove_meta_box( 'authordiv', 'post', 'normal' );
	remove_meta_box( 'tagsdiv-post_tag', 'post', 'side' ); 
	remove_meta_box( 'categorydiv', 'post', 'side' );
	remove_meta_box( 'formatdiv', 'post', 'normal' );
	remove_meta_box( 'trackbacksdiv', 'post', 'normal' );
	remove_meta_box( 'commentstatusdiv', 'post', 'normal' );
}
add_action( 'add_meta_boxes', 'stp_remove_post_meta_boxes' );

// Remove admin bar links
function stp_remove_admin_bar_links() {
	global $wp_admin_bar;
	$wp_admin_bar->remove_menu('comments'); // Comments
	$wp_admin_bar->remove_menu('about'); // Remove the about WordPress link
	$wp_admin_bar->remove_menu('wporg'); // Remove the WordPress.org link
	$wp_admin_bar->remove_menu('documentation'); // Remove the WordPress documentation link
	$wp_admin_bar->remove_menu('support-forums'); // Remove the support forums link
	$wp_admin_bar->remove_menu('feedback'); // Remove the feedback link
	$wp_admin_bar->remove_menu('new-content'); // Remove the content link
	$wp_admin_bar->remove_menu('w3tc'); // If you use w3 total cache remove the performance link
}
add_action( 'wp_before_admin_bar_render', 'stp_remove_admin_bar_links' );

// Remove menu links
function stp_remove_link_menu() {
	remove_menu_page( 'edit-comments.php' ); // Comments
	remove_menu_page( 'link-manager.php' ); // Links
}
add_action( 'admin_menu', 'stp_remove_link_menu' );

// Remove dashboard widgets
function stp_remove_dashboard_widgets() {
	remove_meta_box( 'dashboard_primary', 'dashboard', 'side' );
	remove_meta_box( 'dashboard_secondary', 'dashboard', 'side' );
	remove_meta_box( 'dashboard_quick_press', 'dashboard', 'side' );
	remove_meta_box( 'dashboard_incoming_links', 'dashboard', 'normal' );
	remove_meta_box( 'dashboard_recent_comments', 'dashboard', 'normal' );
	remove_meta_box( 'dashboard_plugins', 'dashboard', 'normal' );
	remove_meta_box( 'ab_widget', 'dashboard', 'normal' ); // Antispam Bee
	remove_meta_box( 'rg_forms_dashboard', 'dashboard', 'normal' );
	remove_meta_box( 'espresso_news_dashboard_widget', 'dashboard', 'normal' ); // Event Espresso
}
add_action( 'wp_dashboard_setup', 'stp_remove_dashboard_widgets' );

// Remove scheme color selection
remove_action( 'admin_color_scheme_picker', 'admin_color_scheme_picker' );

// Remove useless profile fields
function stp_remove_profile_fields( $contactmethods ) {
	unset( $contactmethods['aim'] );
	unset( $contactmethods['jabber'] );
	unset( $contactmethods['yim'] );
	return $contactmethods;
}
add_filter( 'user_contactmethods', 'stp_remove_profile_fields', 10, 1 );