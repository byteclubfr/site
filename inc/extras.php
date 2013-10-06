<?php
/**
 * Various extra functions
 */
 
// Custom title length
function custom_title( $length, $replacer = '...' ) {
	$string = the_title( '', '', FALSE );
	if( strlen( $string ) > $length )
	$string = ( preg_match('/^(.*)\W.*$/', substr( $string, 0, $length+1 ), $matches ) ? $matches[1] : substr( $string, 0, $length ) ) . $replacer;
	echo $string;
}

// Custom article excerpt length
function custom_excerpt($limit) {
	$text = get_the_content('');
	$text = apply_filters('the_content', $text);
	$text = str_replace('\]\]\>', ']]&gt;', $text);
	$text = strip_tags($text);
	$excerpt = explode(' ', $text, $limit);
	if (count($excerpt)>=$limit) {
		array_pop($excerpt);
		$excerpt = implode(" ",$excerpt).' «...»';
	} else {
		$excerpt = implode(" ",$excerpt);
	} 
	$excerpt = preg_replace('`\[[^\]]*\]`','',$excerpt);
	return $excerpt;
}

// Show localized date
function show_localized_date( $lang_slug ) {
	switch ( $lang_slug ) {
		case 'fr':
		the_time( 'd/m/Y' );
		break;
		case 'cn':
		the_time( 'Y/m/d' );
		break;
		case 'en':
		the_time( 'Y/m/d' );
		break;
	}
}

// Get post slug
function get_the_slug( $id ) {
	$post_data = get_post( $id, ARRAY_A );
	$slug = $post_data['post_name'];
	return $slug;
}

// Return True if pagination exists
function show_posts_nav() {
	global $wp_query;
	return ($wp_query->max_num_pages > 1);
}

// Return the ID if the page is a subpage
function is_subpage() {
    global $post;                              // load details about this page
    if ( is_page() && $post->post_parent ) {   // test to see if the page has a parent
        return $post->post_parent;             // return the ID of the parent post
    } else {                                   // there is no parent so ...
        return false;                          // ... the answer to the question is false
    }
}