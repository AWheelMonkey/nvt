###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xe_cisco-sa-20161102-tl1.nasl 11569 2018-09-24 10:29:54Z asteins $
#
# Cisco ASR 900 Series Aggregation Services Routers Buffer Overflow Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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

CPE = "cpe:/o:cisco:ios_xe";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106373");
  script_cve_id("CVE-2016-6441");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11569 $");

  script_name("Cisco ASR 900 Series Aggregation Services Routers Buffer Overflow Vulnerability");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20161102-tl1");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"Update to 3.17.3S, 3.18.2S or later.");

  script_tag(name:"summary", value:"A vulnerability in the Transaction Language 1 (TL1) code of Cisco ASR 900
Series routers could allow an unauthenticated, remote attacker to cause a reload of, or remotely execute code
on, the affected system.");

  script_tag(name:"insight", value:"The vulnerability exists because the affected software performs incomplete
bounds checks on input data. An attacker could exploit this vulnerability by sending a malicious request to the
TL1 port, which could cause the device to reload.");

  script_tag(name:"impact", value:"An exploit could allow the attacker to execute arbitrary code and obtain full
control of the system or cause a reload of the affected system.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-24 12:29:54 +0200 (Mon, 24 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-11-03 15:29:27 +0700 (Thu, 03 Nov 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ios_xe_version.nasl");
  script_mandatory_keys("cisco_ios_xe/version");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( ! model = get_kb_item("cisco_ios_xe/model") ) exit( 0 );

if( model !~ '^ASR90(2|3|7)' ) exit( 99 );

affected = make_list(
		'3.18.0S',
		'3.18.1S',
		'3.17.0S',
		'3.17.2S',
		'3.17.1S' );

foreach af ( affected )
{
  if( version == af )
  {
    if (version =~ "^3\.17")
      fix = "3.17.3S";
    else
      fix = "3.18.2S";
    report = report_fixed_ver(  installed_version:version, fixed_version: fix );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );

