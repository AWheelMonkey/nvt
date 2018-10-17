###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_citrix_netscaler_CTX213313.nasl 11569 2018-09-24 10:29:54Z asteins $
#
# Login Form Hijacking Vulnerability in Citrix NetScaler Gateway (CTX213313)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:citrix:netscaler";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105738");
  script_cve_id("CVE-2016-4945");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 11569 $");

  script_name("Login Form Hijacking Vulnerability in Citrix NetScaler Gateway (CTX213313)");

  script_xref(name:"URL", value:"http://support.citrix.com/article/CTX213313");

  script_tag(name:"impact", value:"An attacker may hijack form values in a NetScaler Gateway login form via cookie tampering resulting in stolen user credentials.");

  script_tag(name:"vuldetect", value:"Check the version");

  script_tag(name:"solution", value:"Update to Citrix NetScaler Gateway version 11.0 Build 66.11 or later");

  script_tag(name:"summary", value:"The Citrix NetScaler installation is vulnerable to a login form hijacking vulnerability");

  script_tag(name:"affected", value:"Version 11.0 earlier than 11.0 Build 66.11.

Versions 10.5, 10.5.e and 10.1 are unaffected by this vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-09-24 12:29:54 +0200 (Mon, 24 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-05-30 12:38:48 +0200 (Mon, 30 May 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_citrix_netscaler_version.nasl");
  script_mandatory_keys("citrix_netscaler/detected");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! vers =  get_app_version( cpe:CPE, nofork: TRUE ) ) exit( 0 );

if( version_in_range( version:vers, test_version:'11', test_version2:'11.0.66.10' ) )
  fix = '11.0 build 66.11';


if( fix )
{
  report = report_fixed_ver( installed_version:vers, fixed_version:fix );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

