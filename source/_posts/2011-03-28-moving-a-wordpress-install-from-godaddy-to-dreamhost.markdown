---
layout: post
title: "Moving a Wordpress install from GoDaddy to Dreamhost"
date: 2011-03-28
comments: true
categories: web
---

I'd say this took some good amounts of research but, it wasn't too hard. I figured an article that explained the whole thing might be nice to have laying around for someone someday.

<strong>** I take no responsibility if this screws with your Wordpress stuff or if things don't work the way you expect. You follow the instructions on your own risk**</strong>

That said I performed this migration about a week ago so they should be relatively accurate. Just be careful and be prepared to mess around with settings and what not on your own in case my description isn't exactly what you need for your specific migration.

Here's what I started out with at the beginning of my endeavor to move <em>back</em> to Dreamhost:
<ul>
	<li> An account with GoDaddy that included hosting <em>and</em> domain registration</li>
	<li>An installed and working version of Wordpress</li>
</ul>
Now we'll start out with the preparation of moving Wordpress.
<ol>
	<li><strong>Sign in</strong> to your <strong>GoDaddy account</strong> and <strong>proceed</strong> to<strong> "My Account"</strong></li>
	<li><strong>Click</strong> on <strong>"Hosting Plans"</strong> under "My Products"</li>
	<li><strong>Select</strong> the <strong>account</strong> you're <strong>moving Wordpress from</strong></li>
	<li>In the top right corner of the pop-up<strong> select "Control Center"</strong></li>
	<li><strong>Click </strong>on the <strong>"Database"</strong> area (towards the bottom of the accordion)</li>
	<li><strong>Select MySQL</strong> option - We're now going to get the MySQL database back-up (Don't worry you shouldn't actually have anything downloaded yet)
<ol>
	<li>For the <strong>database</strong> that is<strong> matched</strong> up<strong> with your Wordpress install </strong>(Should have a description similar to your Wordpress title name)<strong> click</strong> the <strong>little pencil</strong> on the far right of the table</li>
	<li><strong>Click</strong> on <strong>"Password"</strong> and <strong>set it</strong> to something you can <strong>remember</strong> for 5 minutes ;)<strong> write it down </strong>if not<strong> **</strong>Must have one capital letter and one letter<strong>**</strong></li>
	<li>Then look at the lower section labeled <strong>"MySQL Database Information"</strong> and <strong>copy the Username</strong></li>
	<li>Finally <strong>click</strong> on<strong> "Open Manager"</strong> in the top right</li>
	<li>Now use the <strong>Username</strong> and<strong> password</strong> we just got from the past few steps (6.2 &amp; 6.3)</li>
	<li>Alright now you can <strong>select 'Export'</strong>
<ol>
	<li>Here, just <strong>select </strong>the<strong> database name</strong> (under "Export") that we signed in under (<strong>not 'information_schema</strong>'). The database you export will probably contain lots of fields with the prefix "<strong>wp_</strong>"</li>
</ol>
</li>
	<li><strong>Click</strong> the <strong>"MySQL"</strong> radio button to be sure it <strong>exports as a MySQL document</strong></li>
	<li><strong>Check</strong> the box to <strong>'Save as file'</strong> and I personally <strong>cleared</strong> the box for 'File name template' and <strong>set</strong> compression zipped</li>
	<li>Now <strong>save </strong>this <strong>file </strong>in a <strong>folder </strong>let's call it<strong> "wordpress_migration"</strong></li>
</ol>
</li>
	<li>Now <strong>open</strong> up an<strong> ftp client</strong> or <strong>ssh</strong> if you're like me and hate ftp</li>
	<li><strong>Go </strong>to the folder where Wordpress is installed and go to <strong>"wp-content/themes"</strong> and <strong>copy</strong> out any or all themes (copy their <strong>entire folders</strong>) you intend to use in the new Wordpress install</li>
	<li>Also inside "wp-content" be sure to <strong>copy</strong> <strong>folders</strong> for any of the <strong>plugins</strong> you use
<ol>
	<li>I would recommend <strong>placing</strong> these copied folders into the <strong>wordpress_migration</strong> <strong>folder</strong> we talked about creating</li>
</ol>
</li>
	<li>Return to "My Account" on GoDaddy.com and <strong>select your domain registration product</strong> - this will launch the domain manager
<ol>
	<li>Around this point I'll say you should make <strong>SURE </strong> you have everything off that site's ftp that you want to keep</li>
	<li><strong>Select "Nameservers"</strong></li>
	<li><strong>Select "I have specific nameservers"</strong></li>
	<li><strong>Under Nameserver1 copy NS1.DREAMHOST.COM</strong></li>
	<li><strong><strong>Under Nameserver2 copy NS2.DREAMHOST.COM</strong></strong></li>
	<li><strong><strong><strong>Under Nameserver3 copy NS3.DREAMHOST.COM</strong></strong></strong></li>
	<li><strong>Back to "My account"</strong> under GoDaddy.com</li>
	<li><strong>Select</strong> <strong>"Manage my domains"</strong></li>
	<li><strong>Check</strong> your Wordpress <strong>website</strong> and <strong>click "Locking" </strong>towards the top</li>
	<li><strong>Uncheck</strong> <strong>"Lock domains"</strong></li>
	<li>Along the row your domain is <strong>Click </strong>the little icon of <strong>people</strong> (I'm not sure what it looks like) and make sure you <strong>turn off</strong> private registration</li>
	<li><strong>Click</strong> on the little yellow<strong> "D" </strong>then <strong>slecect "Contacts"</strong></li>
	<li><strong>Copy </strong>down the <strong>administrator contact</strong> or change them all to ones you know</li>
	<li>On the page we reached in (10.11) <strong>select</strong> <strong>"Send by email" </strong>under "Authorization code" which is listed under "Expiration date"
<ol>
	<li>Leave this email in your inbox as you'll need it to transfer to DreamHost</li>
</ol>
</li>
</ol>
</li>
	<li><strong>Sign up</strong> at <strong>Dreamhost.com</strong> with the plan you see fit. You get a lot with every plan - even the cheapest</li>
	<li>I <strong>selected</strong> to <strong>transfer</strong> the domain for free with my sign up for an account - use the authorization code we got in step 10.13
<ol>
	<li>You should start getting emails from both GoDaddy and Dreamhost in the next several hours to a few days on the transfer - I know things like should be instant I agree, I'm very impatient when it comes to running web servers and what not. Just <strong>wait a day or two</strong> before you start freaking out. If it's <strong>getting worrisome</strong> start up a <strong>live-chat with Dreamhost</strong> associate. Those chats usually fix my problems if we did miss something.</li>
</ol>
</li>
	<li>Luckily Dreamhost is pretty quick about letting you access your hosting stuff so you can at least start migration
<ol>
	<li><strong>If </strong>you'd like to put <strong>Wordpress on a subdomain </strong>- I generally prefer that - <strong>go to domain management</strong> in <strong>Dreamhost</strong> and <strong>add</strong> a <strong>subdomain</strong> by naming it <em>subdomain.yoursite</em>.com</li>
	<li><strong>Select</strong> <strong>MySQL</strong> <strong>Databases </strong>along the left panel and <strong>create</strong> a database named<em> something of your choice</em> (I don't specify a name because Dreamhost has a large server for MySQL, which means you can't name it something obvious like WordPress or temp). I named mine <em>domainname_blogname</em>. The rest of the options are just for creating a domain for where to access your databases - I'll <strong>refer to</strong> the site as <strong>mysql.yoursite.com</strong> (<strong>remember </strong>your <strong>credentials</strong> for logging in)
<ol>
	<li><strong>Open a new tab </strong>and<strong> migrate </strong>to <strong>mysql.yoursite.com</strong></li>
	<li><strong>Log in </strong></li>
	<li><strong>Unzip </strong>that file we exported from the <strong>old MySQL</strong> database</li>
	<li><strong>Open </strong>the resulting <strong>file</strong> in a <strong>text editor</strong> that has <strong>find all/replace</strong> function (<strong>NOT  WORD</strong>)</li>
	<li><strong>Find all information_schema </strong>and <strong>replace </strong>with<strong> temp</strong></li>
	<li><strong>Save as</strong> a different file than what we opened in case there's an accidental probelm</li>
	<li><strong>Return </strong>to  <strong>PHPMyAdmin </strong>(Probably mysql.yoursite.com)</li>
	<li><strong>Select</strong> <strong>import</strong></li>
	<li><strong>Select </strong>the file we <strong>just saved</strong></li>
	<li>Should be successful - if not send me an email or leave a comment
<ol>
	<li>Some of this last stuff is being <strong>remembered </strong>so I'll help with this last stuff if its not working well</li>
</ol>
</li>
</ol>
</li>
	<li><strong>Go to "One Click installs"</strong> and <strong>install Wordpress </strong> on your domain/subdomain of choice <strong>**DO NOT open the site on a browser yet**</strong>
<ol>
	<li><strong>Using FTP </strong>or <strong>ssh</strong> log into your hosted site (<strong>setup ssh/ftp</strong> users under<strong> "Users"&gt;"Manage Users"</strong>); (<strong>If </strong>you<strong> can't login </strong>using<strong> your site URL </strong>yet because its still transfering <strong>click "Account Status" </strong>in the top right corner and <strong>copy</strong> the <strong>"Web Server" </strong>then your server is <em>servername.</em>dreamhost.com)</li>
	<li><strong>Edit</strong> <strong>wp-config.php </strong>
<ol>
	<li><strong>Set DB_NAME </strong>to the <strong>name</strong> its listed <strong>under</strong> <strong>"PHPMyAdmin"</strong> AKA <strong>"Dreamhost's MySQL Manger" - </strong>probably 3 letters and a bunch of numbers</li>
	<li><strong>Set DB_USER</strong> to the <strong>user</strong> you set<strong> </strong>when you setup the databases at step 13.2</li>
	<li><strong>Set DB_PASSWORD </strong>to the <strong>password </strong>also setup in step 13.2</li>
	<li><strong>Set DB_HOST</strong> to the <strong>URL</strong> set in step 13.2 - something like mysql.<em>yoursite.</em>com</li>
	<li><strong>Set $table_prefix</strong> to '<strong>wp_'</strong></li>
	<li><strong>Save</strong> the file in the same spot you found it</li>
	<li>Now <strong>copy</strong> all of those <strong>plugins</strong> and <strong>themes</strong> in their corresponding spots "wp-content/themes" &amp; "wp-content/plugins"</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
If things aren't working for you tinker with where you think the problem is and let me know what I maybe listed on here incorrectly. This should be all you have to do though. Be prepared to play around with fixing stuff though - doesn't always work quite perfectly. The toughest and most error-prone part will be the database migration.

I hope this helps for any of you trying to escape the horrid wrath that is GoDaddy. Perhaps more tutorials to come as I try to set up a good spot for my git repositories.
