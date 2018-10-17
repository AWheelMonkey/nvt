###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpbb_37882.nasl 9332 2018-04-05 12:51:29Z cfischer $
#
# phpBB Forum ID Security Bypass Vulnerability
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

CPE = "cpe:/a:phpbb:phpbb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100463");
  script_version("$Revision: 9332 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 14:51:29 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-01-25 18:49:48 +0100 (Mon, 25 Jan 2010)");
  script_cve_id("CVE-2010-1630");
  script_bugtraq_id(37882);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("phpBB Forum ID Security Bypass Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("phpbb_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("phpBB/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37882");
  script_xref(name:"URL", value:"http://www.phpbb.com/community/viewtopic.php?f=14&p=9764445");
  script_xref(name:"URL", value:"http://www.phpbb.com/");

  script_tag(name:"impact", value:"Attackers can exploit this vulnerability to bypass certain security
  restrictions and gain unauthorized access to the affected application.");

  script_tag(name:"affected", value:"Versions prior to phpBB 3.0.5 are vulnerable.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for details.");

  script_tag(name:"summary", value:"phpBB is prone to a security-bypass vulnerability.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"3.0.5" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.0.5" );
  security_message( port:port, data:report );
  exit( 0 );
}  

exit( 99 );