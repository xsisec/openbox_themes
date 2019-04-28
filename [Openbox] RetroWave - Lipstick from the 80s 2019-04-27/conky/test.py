#!/usr/bin/env python
import feedparser # pip install feedparser

d = feedparser.parse('http://feeds.huffingtonpost.com/huffingtonpost/latestnews')
# .. skipped handling http errors, cacheing ..

for e in d.entries:
    print(e.title)
    print(e.link)
    print(e.description)
    print("\n") # 2 newlines
