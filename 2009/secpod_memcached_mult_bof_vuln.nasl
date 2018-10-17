###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_memcached_mult_bof_vuln.nasl 8974 2018-02-28 09:53:03Z cfischer $
#
# Memcached 'CVE-2009-2415' Multiple Buffer Overflow Vulnerabilities
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

CPE = "cpe:/a:memcached:memcached";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900914");
  script_version("$Revision: 8974 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-28 10:53:03 +0100 (Wed, 28 Feb 2018) $");
  script_tag(name:"creation_date", value:"2009-08-20 09:27:17 +0200 (Thu, 20 Aug 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-2415");
  script_bugtraq_id(35989);
  script_name("Memcached 'CVE-2009-2415' Multiple Buffer Overflow Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Buffer overflow");
  script_dependencies("gb_memcached_detect.nasl");
  script_mandatory_keys("Memcached/detected");

  script_xref(name:"URL", value:"http://seclists.org/bugtraq/2009/Aug/0055.html");

  tag_solution = "Apply the patch for Debian
  http://www.debian.org/security/2009/dsa-1853

  *****
  NOTE: Please ignore this warning if the patch is applied.
  *****";

  tag_impact = "Successful exploitation will let the attacker execute arbitrary code on the
  affected system via readily available network utilities.";

  tag_affected = "Memcached version 1.1.12 and 1.2.2";

  tag_insight = "Heap overflow errors occur due to integer conversions when parsing certain
  length attributes.";

  tag_summary = "The host is running Memcached and is prone to multiple Buffer
  Overflow vulnerabilities.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_proto( cpe:CPE, port:port ) ) exit( 0 );

vers  = infos["version"];
proto = infos["proto"];

if( version_is_equal( version:vers, test_version:"1.1.12" ) ||
    version_is_equal( version:vers, test_version:"1.2.2" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references" );
  security_message( port:port, proto:proto, data:report );
  exit( 0 );
}

exit( 99 );