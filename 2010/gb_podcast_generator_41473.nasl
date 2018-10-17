###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_podcast_generator_41473.nasl 8528 2018-01-25 07:57:36Z teissa $
#
# Podcast Generator 'download.php' Directory Traversal Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "Podcast Generator is prone to a directory-traversal vulnerability
because it fails to sufficiently validate user-supplied input data.

Exploiting the issue can allow an attacker to obtain sensitive
information that may aid in further attacks.

Podcast Generator 1.3 running on Windows is vulnerable; other versions
may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100709");
 script_version("$Revision: 8528 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:57:36 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-07-09 12:33:08 +0200 (Fri, 09 Jul 2010)");
 script_bugtraq_id(41473);

 script_name("Podcast Generator 'download.php' Directory Traversal Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/41473");
 script_xref(name : "URL" , value : "http://www.scribd.com/doc/28080332/Podcast-Generator-1-3-Arbitrary-File-Download-Windows");
 script_xref(name : "URL" , value : "http://podcastgen.sourceforge.net/download.php?lang=en");

 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("os_detection.nasl","podcast_generator_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_mandatory_keys("Host/runs_windows");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

if(vers = get_version_from_kb(port:port,app:"podcast_generator")) {

  if(version_is_less_equal(version: vers, test_version: "1.3")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
