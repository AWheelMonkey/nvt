###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_axon_39483.nasl 4900 2017-01-02 09:13:30Z cfi $
#
# Axon Virtual PBX 2.13 Multiple Remote Vulnerabilities
#
# Authors:
# Michael Meyer
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

CPE = "cpe:/a:nch:axon_virtual_pbx";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100576");
  script_version("$Revision: 4900 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-02 10:13:30 +0100 (Mon, 02 Jan 2017) $");
  script_tag(name:"creation_date", value:"2010-04-15 19:15:10 +0200 (Thu, 15 Apr 2010)");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
  script_bugtraq_id(39483);
  script_name("Axon Virtual PBX 2.13 Multiple Remote Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_axon_virtual_pbx_web_detect.nasl");
  script_require_ports("Services/www", 81);
  script_mandatory_keys("Axon-Virtual-PBX/www/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/39483");
  script_xref(name:"URL", value:"http://www.nch.com.au/pbx/index.html");
  script_xref(name:"URL", value:"http://nchsoftware.com/");

  tag_summary = "NCH Software Axon virtual PBX is prone to multiple remote
  vulnerabilities, including:

  - A cross-site scripting vulnerability.
  - A cross-site request forgery vulnerability.
  - An arbitrary file deletion vulnerability.
  - A directory traversal vulnerability.";

  tag_impact = "An attacker may leverage these issues to cause a denial-of-service
  condition, run arbitrary script code in the browser of an unsuspecting
  user in the context of the affected application, steal cookie-based
  authentication credentials, perform certain administrative actions,
  gain unauthorized access to the affected application, delete certain
  data, and overwrite arbitrary files. Other attacks are also possible.";

  tag_affected = "Axon 2.13 is vulnerable; other versions may also be affected.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE, service:"www" ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"2.13" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"Unknown" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );