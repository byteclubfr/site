<?php
/**
 * Customize TinyMCE editor
 */

// Define available elements
add_filter('tiny_mce_before_init', 'stp_define_elements');
function stp_define_elements($elements) {
	// @see http://www.tinymce.com/wiki.php/Configuration:theme_advanced_blockformats
	$elements['theme_advanced_blockformats'] = 'h2,h3,p';
	return $elements;
}