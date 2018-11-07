###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_dropbear_ssh_62958_62993.nasl 12095 2018-10-25 12:00:24Z cfischer $
#
# Dropbear SSH Server Multiple Security Vulnerabilities
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2014 SCHUTZWERK GmbH
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

CPE = 'cpe:/a:matt_johnston:dropbear_ssh_server';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105114");
  script_version("$Revision: 12095 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:00:24 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-11-07 12:40:00 +0100 (Fri, 07 Nov 2014)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_cve_id("CVE-2013-4421", "CVE-2013-4434");
  script_bugtraq_id(62958, 62993);

  script_name("Dropbear SSH Server Multiple Security Vulnerabilities");


  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (c) 2014 SCHUTZWERK GmbH");
  script_family("General");
  script_dependencies("gb_dropbear_ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("dropbear/installed");

  script_tag(name:"summary", value:"This host is installed with Dropbear SSH Server and
  is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - The buf_decompress function in packet.c in Dropbear SSH Server before 2013.59
  allows remote attackers to cause a denial of service (memory consumption)
  via a compressed packet that has a large size when it is decompressed.

  - Dropbear SSH Server before 2013.59 generates error messages for a failed
  logon attempt with different time delays depending on whether the user account
  exists.");
  script_tag(name:"impact", value:"The flaws allows remote attackers to cause a denial of service
  or to discover valid usernames.");
  script_tag(name:"affected", value:"Versions prior to Dropbear SSH Server 2013.59 are vulnerable.");
  script_tag(name:"solution", value:"Updates are available.");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/62958");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/62993");
  script_xref(name:"URL", value:"https://matt.ucc.asn.au/dropbear/dropbear.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

ver = eregmatch( pattern:"^([0-9]+)\.([0-9]+)", string:vers );

if( isnull( ver[2] ) ) exit( 0 );

if( int( ver[1] ) > 2013 ) exit( 99 );

if(version_is_less(version:ver[2], test_version:"59")) {

  report = 'Installed version: ' + vers + '\n' +
           'Fixed version:     ' + "2013.59" + '\n';
  security_message( port:port, data:report );
  exit(0);
}

exit(99);
