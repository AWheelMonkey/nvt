# OpenVAS Vulnerability Test
# $Id: apache_dir_listing.nasl 6540 2017-07-05 12:42:02Z cfischer $
# Description: Apache Directory Listing
#
# Authors:
# Matt Moore <matt.moore@westpoint.ltd.uk>
#
# Copyright:
# Copyright (C) 2001 Matt Moore
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "By making a request to the Apache web server ending in '?M=A' it is sometimes possible to obtain a 
directory listing even if an index.html file is present.

It appears that it is possible to retrieve a directory listing from the root of the Apache
web server being tested. However, this could be because there is no 'index.html' or similar 
default file present.";

tag_solution = "Unless it is required, turn off Indexing by making the appropriate changes to your 
httpd.conf file.";

# Requests can be: /?M=A or /?S=D [etc]
# 
# Note: if mod_autoindex is loaded and FancyIndexing 
# is on, the links are interpreted _even_ if there is an index.
# 
# "You can disable this by setting IndexOptions +SuppressColumnSorting
#  for any/all directories that have indexing enabled."
# 
# Date:  Tue, 10 Jul 2001 10:15:19 -0400
# From: "W. Craig Trader" <ct7@unicornsrest.org>
# Affiliation: Unicorn's Rest
# To: "Kevin" <kevin@brasscannon.net>
# CC: bugtraq@securityfocus.com
# Subject: Re: How Google indexed a file with no external link

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10704");
  script_version("$Revision: 6540 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-05 14:42:02 +0200 (Wed, 05 Jul 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(3009);
  script_xref(name: "OWASP", value: "OWASP-CM-004");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2001-0731");
  script_name("Apache Directory Listing");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2001 Matt Moore");
  script_family("Web Servers");
  script_dependencies("gb_get_http_banner.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("apache/banner");

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

# Make a request for the root directory followed by ?M=A
# to see if Apache is misconfigured and will give a directory
# listing instead of the index.html page (or other default doc).
# 
# Could be improved to use output of webmirror.nasl to make requests for
# other directories which could be misconfigured, too.
#

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
banner = get_http_banner( port:port );
if( ! banner || "Apache" >!< banner ) exit( 0 );

# First, we make sure that the remote server is not already
# spitting the content of the directory.
res = http_get_cache( item:"/", port:port );
if( "Index of " >< res ) exit( 0 );

# Now we perform the check
req = http_get( item:"/?M=A", port:port );
res = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( ( "Index of " >< res ) && ( "Last modified" >< res ) ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );