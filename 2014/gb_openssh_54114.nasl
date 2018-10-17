###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssh_54114.nasl 11187 2018-09-03 09:59:13Z mmartin $
#
# OpenSSH 'ssh_gssapi_parse_ename()' Function Denial of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:openbsd:openssh";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103937");
  script_bugtraq_id(54114);
  script_cve_id("CVE-2011-5000");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_version("$Revision: 11187 $");
  script_name("OpenSSH 'ssh_gssapi_parse_ename()' Function Denial of Service Vulnerability");
  script_tag(name:"last_modification", value:"$Date: 2018-09-03 11:59:13 +0200 (Mon, 03 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-04-09 12:03:56 +0200 (Wed, 09 Apr 2014)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("openssh/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/54114");
  script_xref(name:"URL", value:"http://www.openssh.com");

  script_tag(name:"impact", value:"Exploiting this issue allows remote attackers to trigger
  denial-of-service conditions due to excessive memory consumption. ");
  script_tag(name:"vuldetect", value:"Check the version.");
  script_tag(name:"solution", value:"Updates are available. Please see the references for details.");
  script_tag(name:"summary", value:"OpenSSH is prone to a remote denial-of-service vulnerability.");
  script_tag(name:"affected", value:"OpenSSH 5.8 and prior are vulnerable. ");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"5.8" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );