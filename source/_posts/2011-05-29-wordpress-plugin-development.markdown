---
layout: post
title: "Wordpress Plugin development"
date: 2011-05-29
comments: true
categories: blog web development
---

Well I've decided to keep the site like this now. I found a way to make this style doable and it seems silly to continually seek out the most minimalist style when I could just use what I have and do something useful with time. Speaking of being useful with my time; I've been working on a Wordpress plugin that makes it easy to display some article properties in a nice way. When working with a friend of mine to create a blogging site in which we introduce a number of Open Source programs and tutorial them for our readers. After writing a few articles we realized something: not everyone writes at the same level; that is, some of us expect more from our readers. We also noticed that some of our applications weren't totally cross platform. This sparked an idea for a Wordpress plugin. To simplify telling our readers, easily, what platforms and how difficult an article or tutorial will be.

First, I read the introduction <a title="Writing a plugin" href="http://codex.wordpress.org/Writing_a_Plugin" target="_blank">Codex page</a> for plugin development. This directed me across several of the Wordpress documentation pages so that I could find a basic understanding for how to approach my plugin. This was my first real plugin for something so I was very interested to see how the general idea is handled. Since its a plugin and you want someone to be able Install and Activate and start using, with no further customization. To a certain extent this seems limiting from a developer perspective because you cannot intervene anywhere else in your code to get your plugin to work, because if you had to do that then anyone else installing and using your plugin would have to get their hands dirty to get the plugin to work.

So Wordpress handles plugins by allowing developers to "hook" functions to standard Wordpress functions. For instance, when someone loads a Wordpress page there is a function called "the_content" that is run, which calls to the database and gets all of the content for that post/page. Without going into details about header information I must have this in php file:

{% codeblock lang:javascript %}
function plugin_content ( $str ) {
	$str = "Hello plugin" + $str;
	return $str;
}
add_action( 'the_content', 'plugin_content' );
{% endcodeblock %}

Quick notice: we gain access to the post content by using a parameter, Wordpress doesn't make it too obvious that you have access to such parameters, but as far as I can tell, you have access to what the attachable function's return. That is, here we have access to what the_content() would return. You want to be sure to return the one parameter you accept. <a title="Actions" href="http://codex.wordpress.org/Plugin_API#Actions" target="_blank">Some explanation</a>

This simple plugin will add "Hello plugin" at the beginning of each post content on loading each page. It will not alter the database information, but will only add the content on loading of each post. Part of the beauty of plugins is that we don't have to screw up a user's database in the process. One thing you may realize is that this is only part of what we need in a plugin like I want to achieve. I want something where each post has its own properties, that stick with that post. So we need to also handle usage of meta boxes on the post. Here there are a few options: let the user utilize meta boxes without guidance (dangerous, may render plugin near useless), fill in meta boxes using a little html magic, or fill in inivisble meta boxes. The last option is ideal because this stops the user from accidentally changing something, which could break the plugin or at least the reading of one of their posts. To add and save meta boxes we need something like:
{% codeblock lang:javascript %}
/**
* Setup meta box spot in edit post action
*/

function metabox() {
// Post meta box
	add_meta_box(
	
	// this is HTML id of the box on edit screen
			'difficulty',
	// title of the box
			'Platforms &amp; Difficulty Plugin',
	// function to be called to display the checkboxes, see the function below
			'meta_box_content',
	// on which edit screen the box should appear
			'post',
	// part of page where the box should appear
			'side',
	// priority of the box
			'default'
	);
}
// at the add_meta_boxes hook run our function and create the meta box
add_action( 'add_meta_boxes', 'metabox' ); 
/**
* Fill in the meta box with check boxes and radio buttons
*/
function meta_box_content( $post_id ) {
	global $post; // Needed if you want to access global post information.

	// nonce field for security check, you can have the same
	// nonce field for all your meta boxes of same plugin
	wp_nonce_field( plugin_basename( __FILE__ ), 'nonce' );
	// make more unique - assures security between post

	// Adds the invisible meta field for necessary data
	// "_" prefix makes field invisible for user editing
	add_post_meta(
		$post_id, // Post that is receiving the values
		'_some_val', // Meta variable name
		"some info", // Value being entered into the variable '_some_val'
		true // Make unique, so don't allow multiple copies to be created
	); // Since we make sure the variable is only
	// allowed to be created if unique, I run this
	// at the beginning of edit action to be sure
	// the variable exists before I start working with the post

	$val = get_post_meta( $post_id, '_some_val', true ); // Gets the value for
	// "_some_val," which would be "some info" if we just created, but
	// could be some unique info if the user has interacted with the plugin on this post before.

	// Getting post meta information here so that I can fill in our html so that it
	// looks like the post "remembered" its meta information.

	echo ""; // Insert some html and use get_post_meta variables to fill it in so it looks the way they saved it

	return $post_id;
} // we don't need to add_action because its referred as the meta box function in our above
// function - its registered as the function that actually fills it in

/**
* Save our meta box data into invisble meta fields
*/
function save_meta( $post_id ) {
	global $post;
	// check if this isn't an auto save
	if ( defined( 'DOING_AUTOSAVE' ) &amp;&amp; DOING_AUTOSAVE ){
		return $post_id;
	}
	else{
		if ( !wp_verify_nonce( $_POST['nonce'], plugin_basename( __FILE__ ) ) ){
	// be sure the _POST['nonce'] matches your nonce from above - must be the
	// same to work, but should be unique from other things

			return;
		}

		// called after a post or page is saved and not on autosave
		if( $parent_id = wp_is_post_revision( $post_id ) ){
			$post_id = $parent_id;
		}

		// now store data in custom fields based on checkboxes/radios selected
		$val = $_POST['_some_val'];
		// grabs the current data from the html we used in the above function
		update_post_meta( $post_id, '_some_val', $val );
	// updates information with what grabbed from the post submit
	}
}
add_action(  'save_post', 'save_meta' );
{% endcodeblock %}
Now with the above set of functions we just need to utilize our meta variables to insert something into the post, as I showed earlier in this post. If you'd like to see my project where I put all of this information together go to <a href="https://github.com/jphenow/WP-Difficulty-and-Platform/blob/master/difficulty.php" target="_blank">my github</a>. As development proceeds I will be adding a global settings page where users can change everything about the plugin. Currently my plugin allows them to pick associated platforms so I'd like to allow them to change the icons and even what they're including on each page. For instance instead of the plugin specifying platform or difficulty they can specify what general people or topics are being discussed on a post.
