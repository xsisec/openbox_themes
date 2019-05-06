#!/usr/bin/env python2

## check-gmail.py -- A command line util to check GMail -*- Python -*-
## modified to display mailbox summary for conky

# ======================================================================
# Copyright (C) 2006 Baishampayan Ghose <b.ghose@ubuntu.com>
# Modified 2008 Hunter Loftis <hbloftis@uncc.edu>
# Time-stamp: Mon Jul 31, 2006 20:45+0530
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
# ======================================================================

import sys
import datetime
import urllib             # For BasicHTTPAuthentication
import feedparser         # For parsing the feed
from textwrap import wrap

_URL = "https://mail.google.com/gmail/feed/atom"

uname = ""
#uname = sys.argv[1]
password = "" 
#password = sys.argv[2]
#maxlen = sys.argv[3]
maxlen = 10

urllib.FancyURLopener.prompt_user_passwd = lambda self, host, realm: (uname, password)
    
def auth():
    '''The method to do HTTPBasicAuthentication'''
    opener = urllib.FancyURLopener()
    f = opener.open(_URL)
    feed = f.read()
    return feed

def readmail(feed, maxlen):
    '''Parse the Atom feed and print a summary'''
    atom = feedparser.parse(feed)
    now = datetime.datetime.now()
    #print '${color red}Mail: %s@gmail.com (%s new)' % (uname, len(atom.entries)) 
    print ' Last updated: ',now.strftime("%Y-%m-%d %H:%M\n")
    for i in range(min(len(atom.entries), maxlen)):
        print('${color green}%s') % atom.entries[i].title.encode('ascii', 'ignore')
        print('${color gray}    %s\n') % atom.entries[i].author.encode('ascii', 'ignore')
    if len(atom.entries) > maxlen:
       print ' ${color0}more'
if __name__ == "__main__":
    f = auth()  # Do auth and then get the feed
    readmail(f, int(maxlen)) # Let the feed be chewed by feedparser
