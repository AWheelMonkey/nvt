###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ipswitch_imail_server_11_02.nasl 7506 2017-10-19 11:45:46Z cfischer $
#
# Ipswitch IMail Server < 11.02 multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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

CPE = "cpe:/a:ipswitch:imail_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100718");
  script_version("$Revision: 7506 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-19 13:45:46 +0200 (Thu, 19 Oct 2017) $");
  script_tag(name:"creation_date", value:"2010-07-16 12:38:11 +0200 (Fri, 16 Jul 2010)");
  script_bugtraq_id(41719, 41718, 41717);
  script_tag(name:"cvss_base", value:"9.7");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:C/A:C");
  script_name("Ipswitch IMail Server < 11.02 multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_ipswitch_imail_server_detect.nasl");
  script_mandatory_keys("Ipswitch/IMail/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/41719");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/41718");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/41717");
  script_xref(name:"URL", value:"http://www.ipswitch.com/Products/IMail_Server/index.html");
  script_xref(name:"URL", value:"http://www.zerodayinitiative.com/advisories/ZDI-10-127/");

  tag_summary = "Ipswitch IMail Server < 11.02  is prone to multiple Vulnerabilities.";

  tag_insight = "1. Multiple buffer-overflow Vulnerabilities because it fails to perform adequate
  boundary checks on user- supplied data.

  2. Multiple remote code-execution vulnerabilities.";

  tag_impact = "An attacker can exploit these issues to execute arbitrary code with
  SYSTEM-level privileges. Successfully exploiting these issues will
  result in the complete compromise of affected computers. Failed
  exploit attempts will result in a denial-of-service condition.";

  tag_affected = "Ipswitch IMail Server versions prior to 11.02 are vulnerable.";

  tag_solution = "Vendor updates are available. Please contact the vendor for more
  information.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit(0);

if( version_is_less( version:version, test_version:"11.02" ) ) {
  report = report_fixed_ver( installed_version:version, fixed_version:"11.02" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
