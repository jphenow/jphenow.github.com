require "mysql"
path = "./source/_posts/ruby/"
my = Mysql::new("mysql.jphenow.com", "jphenow", "Pf1neau0512", "jph1009110563071")
res = my.query("select * from wp_posts")
stuff = []
res.each do |row|
	# index 0 is ID
	# index 1 is author ID -- needs join from wp_users
	# index 2 is date
	# index 3 is date
	# index 4 is post content
	# index 5 seems to be title, should check why its repeated
	stuff.push row[7]
	title = row[5].downcase.split.join('-')
	date = row[2].split[0]
	fname = "%s%s-%s.markdown" % [path, date, title]
	doc = row[4]
	yaml = <<YAML
---
layout: post
title: "#{row[5]}"
date: #{date}
comments: true
---

YAML
	File.open(fname, 'w') do |f|
		f.write(yaml)
		f.write(doc)
	end
end
