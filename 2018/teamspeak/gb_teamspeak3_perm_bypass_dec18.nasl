###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_teamspeak3_perm_bypass_dec18.nasl 12842 2018-12-20 08:39:17Z cfischer $
#
# TeamSpeak 3 Server < 3.5.1 Permission Checks Bypass
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:teamspeak:teamspeak3";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108523");
  script_version("$Revision: 12842 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-20 09:39:17 +0100 (Thu, 20 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-20 07:47:54 +0100 (Thu, 20 Dec 2018)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("TeamSpeak 3 Server < 3.5.1 Permission Checks Bypass");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_teamspeak_detect.nasl");
  script_require_ports("Services/teamspeak-serverquery", 10011);
  script_mandatory_keys("teamspeak3_server/installed");

  script_xref(name:"URL", value:"https://forum.teamspeak.com/threads/138368-TeamSpeak-3-server-3-5-1-hotfix-released");

  script_tag(name:"summary", value:"This host is running a TeamSpeak 3 server and allows to bypass permission checks.");

  script_tag(name:"impact", value:"Exploiting this vulnerability may allow an attacker to gain talk power and channel
  commander temporarily, to set their own avatar and client descriptions, and made it possible to prevent a client ban.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"TeamSpeak 3 server version prior to 3.5.1.");

  script_tag(name:"solution", value:"Update your TeamSpeak 3 server to version 3.5.1 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"3.0", test_version2:"3.5.0" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.5.1" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );