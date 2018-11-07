###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_database_server_mult_vuln_apr06.nasl 12047 2018-10-24 07:38:41Z cfischer $
#
# Oracle Database Server Multiple Unspecified Vulnerabilities - April 06
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:database_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802538");
  script_version("$Revision: 12047 $");
  script_cve_id("CVE-2006-1868", "CVE-2006-1871", "CVE-2006-1872",
                "CVE-2006-1873", "CVE-2006-1874");
  script_bugtraq_id(17590);
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-24 09:38:41 +0200 (Wed, 24 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-12-08 14:37:52 +0530 (Thu, 08 Dec 2011)");
  script_name("Oracle Database Server Multiple Unspecified Vulnerabilities - April 06");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("oracle_tnslsnr_version.nasl");
  script_mandatory_keys("OracleDatabaseServer/installed");

  script_xref(name:"URL", value:"http://secunia.com/advisories/19712");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1015961");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/26049");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/26047");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/26068");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/26053");
  script_xref(name:"URL", value:"http://www.us-cert.gov/cas/techalerts/TA06-109A.html");
  script_xref(name:"URL", value:"http://www.red-database-security.com/advisory/oracle_cpu_apr_2006.html");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/431345/30/5490/threaded");

  script_tag(name:"impact", value:"An unspecified impact and attack vectors.");
  script_tag(name:"affected", value:"Oracle Database server versions 8.1.7.4, 9.0.1.5, 9.2.0.6, 9.2.0.7, 10.1.0.4,
  10.1.0.5 and 10.2.0.1");
  script_tag(name:"insight", value:"The flaws are due to unspecified errors in the multiple components.");
  script_tag(name:"summary", value:"This host is running Oracle database and is prone to multiple
  unspecified vulnerabilities.");
  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujul2006-101315.html");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"10.2.0.0" ) ||
    version_in_range( version:vers, test_version:"9.0.1", test_version2:"9.0.1.4" ) ||
    version_in_range( version:vers, test_version:"8.1.0", test_version2:"8.1.7.3" ) ||
    version_in_range( version:vers, test_version:"9.2.0", test_version2:"9.2.0.6" ) ||
    version_in_range( version:vers, test_version:"10.1.0", test_version2:"10.1.0.4" ) ||
    version_is_equal( version:vers, test_version:"8.1.7.4" ) ||
    version_is_equal( version:vers, test_version:"9.0.1.5" ) ||
    version_is_equal( version:vers, test_version:"9.2.0.7" ) ||
    version_is_equal( version:vers, test_version:"10.1.0.5" ) ||
    version_is_equal( version:vers, test_version:"10.2.0.1 " ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );