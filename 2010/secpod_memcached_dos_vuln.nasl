###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_memcached_dos_vuln.nasl 8974 2018-02-28 09:53:03Z cfischer $
#
# Memcached < 1.4.3 Denial of Service Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.901103");
  script_version("$Revision: 8974 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-28 10:53:03 +0100 (Wed, 28 Feb 2018) $");
  script_tag(name:"creation_date", value:"2010-04-23 17:57:39 +0200 (Fri, 23 Apr 2010)");
  script_cve_id("CVE-2010-1152");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Memcached < 1.4.3 Denial of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_memcached_detect.nasl");
  script_mandatory_keys("Memcached/detected");

  script_xref(name:"URL", value:"http://secunia.com/advisories/39306");
  script_xref(name:"URL", value:"http://code.google.com/p/memcached/issues/detail?id=102");

  tag_impact = "Successful exploitation will allow attacker to cause a denial of service.

  Impact Level: Application";

  tag_affected = "Memcached 1.4.2 and prior";

  tag_insight = "The flaw is due to error in try_read_command() function that allows attacker
  to temporarily hang or potentially crash the server by sending an overly
  large number of bytes.";

  tag_solution = "Upgrade to the latest version of Memcached 1.4.3 or later,

  For updates refer to http://memcached.org";

  tag_summary = "The host is running Memcached and is prone to Denial of Service
  vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

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

if( version_is_less( version:vers, test_version:"1.4.3" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.4.3" );
  security_message( port:port, proto:proto, data:report );
  exit( 0 );
}

exit( 99 );