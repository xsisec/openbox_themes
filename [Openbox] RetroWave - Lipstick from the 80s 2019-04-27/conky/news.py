import feedparser
rss_url = "https://hnrss.org/newest"
feed = feedparser.parse( rss_url )
count =  len(feed['entries'])
for i in range(0, count):
	if (i>=5):break
	#print '{1}'.format(' ', feed.entries[i].title[0:100].encode('utf8'))
	print '{2}'.format(' ', feed.entries[i].source[0:100].encode('utf8'))
