#!/usr/bin/env python

# File: calgen.py
# Version: 0.1
# Description: generate various calendar files
# Last Modified: 2009
# Author: Tobias Markmann (tm@ayena.de)
# License: public domain
# HowTo: ./calgen.py

## LICENSE ##
#
# Copyright (c) 1999 - 2009 XMPP Standards Foundation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
## END LICENSE ##

import pickle
import commands
import os
import re
import sys
import getopt
import glob

from xml.dom.minidom import parse,parseString,Document,getDOMImplementation
from datetime import datetime, timedelta
from icalendar import Calendar, Event, UTC, vText

CALPATH = "/var/www/vhosts/xmpp.org/calendar"

allevents = [];

def getText(nodelist):
    thisText = ""
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            thisText = thisText + node.data
    return thisText

class XEPInfo:
	def __init__(self, filename):
		thexep = parse(filename)
		xepNode = (thexep.getElementsByTagName("xep")[0])
		headerNode = (xepNode.getElementsByTagName("header")[0])
		titleNode = (headerNode.getElementsByTagName("title")[0])
		self.title = getText(titleNode.childNodes)
		self.nr = getText((headerNode.getElementsByTagName("number")[0]).childNodes)
		abstractNode = (headerNode.getElementsByTagName("abstract")[0])
		abstract = getText(abstractNode.childNodes)
		statusNode = (headerNode.getElementsByTagName("status")[0])
		self.status = getText(statusNode.childNodes)
		self.type = getText((headerNode.getElementsByTagName("type")[0]).childNodes)
		revNode = (headerNode.getElementsByTagName("revision")[0])
		version = getText((revNode.getElementsByTagName("version")[0]).childNodes)
		self.date = getText((revNode.getElementsByTagName("date")[0]).childNodes)
	
	def getNr(self):
		return self.nr
	
	def getTitle(self):
		return self.title
	
	def getStatus(self):
		return self.status
	
	def getType(self):
		return self.type
	
	def getDate(self):
		return self.date

def parseXEP( cal, xep_file ):
	xep = XEPInfo(xep_file)
	if xep.getStatus() == "Experimental":
		date = xep.getDate()
		last_updated = datetime.strptime(xep.getDate(), "%Y-%m-%d")
		expires = last_updated + timedelta(days=365)
		day = timedelta(days=1)
		# print "XEP-" + xep.getNr() + ": " + xep.getTitle() + " expires on " + str(expires)
		event = Event()
		event.add('summary', "XEP-" + xep.getNr() + ": " + xep.getTitle() + " expires")
		event.add('dtstart', expires.date())
		event.add('dtend', (expires + day).date())
		event.add("dtstamp", (expires + day).date())
		cal.add_component(event)
		allevents.append(event)

def genExtensionsCalendar( cal_file ):
	cal = Calendar()
	cal.add('prodid', '-//calgen.py//xmpp.org//')
	cal.add('version', '2.0')
	files = glob.glob('extensions/xep-????.xml')
	files.sort(key=lambda x: x.lower())
	for file in files:
		parseXEP( cal, file)
	
	f = open( cal_file , 'wb')
	f.write(cal.as_string())
	f.close()

def genCalendarFromEventsFile( events_file, cal_file ):
	print "bla"
	
def genAllEventsCalendar( cal_file ):
	print "bla"

def main(argv):
	genCalendarFromEventsFile("council/events.xml", CALPATH + "/xsf-council.ics")
	genCalendarFromEventsFile("xsf/board/events.xml", CALPATH + "/xsf-board.ics")
	genCalendarFromEventsFile("xsf/events.xml", CALPATH + "/xsf-xsf.ics")
	genExtensionsCalendar(CALPATH + "/xsf-extensions.ics")
	genAllEventsCalendar(CALPATH + "/xsf-all.ics")
	
if __name__ == "__main__":
	main(sys.argv[1:])