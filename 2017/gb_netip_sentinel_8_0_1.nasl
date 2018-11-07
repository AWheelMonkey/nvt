###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netip_sentinel_8_0_1.nasl 12083 2018-10-25 09:48:10Z cfischer $
#
# Sentinel Server Leakage of Information and Remote Denial of Service Issue
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:netiq:sentinel";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140233");
  script_cve_id("CVE-2017-5184", "CVE-2017-5185");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_version("$Revision: 12083 $");

  script_name("Sentinel Server Leakage of Information and Remote Denial of Service Issue");

  script_xref(name:"URL", value:"https://www.netiq.com/support/kb/doc.php?id=7018753");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version/revision is present on the target host.");

  script_tag(name:"solution", value:"Customers should upgrade to Sentinel 8.0.1.");

  script_tag(name:"summary", value:"A vulnerability was discovered in NetIQ Sentinel Server that may allow leakage of information and remote denial of service.");
  script_tag(name:"affected", value:"NetIQ Sentinel 8.0 Sentinel Server.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-25 11:48:10 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-31 15:01:13 +0200 (Fri, 31 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_netiq_sentinel_detect.nasl");
  script_mandatory_keys("netiq_sentinel/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version !~ "^8\.0" ) exit( 99 );

if( version_is_less( version:version, test_version:"8.0.1" ) )
{
  report = report_fixed_ver( installed_version:version, fixed_version:"8.0.1" );

  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );