###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nodejs_dns_rebinding_vuln_macosx.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Node.js DNS rebinding vulnerability (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:nodejs:node.js";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813480");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-7160");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-10 11:51:55 +0530 (Tue, 10 Jul 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Node.js DNS rebinding vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with Node.js and is
  prone to a DNS rebinding vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to inclusion of an
  errored service called 'inspector' or 'debugger'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute remote code on affected system.");

  script_tag(name:"affected", value:"Node.js versions 6.x prior to 6.14.0, 8.x
  prior to 8.11.0 and 9.x prior to 9.10.0");

  script_tag(name:"solution", value:"Upgrade to Node.js version 6.14.0 or 8.11.0
  or 9.10.0 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://nodejs.org/en/blog/vulnerability/june-2018-security-releases/");
  script_xref(name:"URL", value:"https://nodejs.org");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_nodejs_detect_macosx.nasl");
  script_mandatory_keys("Nodejs/MacOSX/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( isnull( appPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! infos = get_app_version_and_location( cpe:CPE, port:appPort, exit_no_version:TRUE ) ) exit( 0 );
nodejsVer = infos['version'];
appPath = infos['location'];

if(nodejsVer =~ "^6\." && version_is_less(version:nodejsVer, test_version:"6.14.0")){
  fix = "6.14.0";
}

else if(nodejsVer =~ "^8\." && version_is_less(version:nodejsVer, test_version:"8.11.0")){
  fix = "8.11.0";
}

else if(nodejsVer =~ "^9\." && version_is_less(version:nodejsVer, test_version:"9.10.0")){
  fix = "9.10.0";
}

if(fix)
{
  report = report_fixed_ver(installed_version:nodejsVer, fixed_version:fix, install_path:appPath);
  security_message(port:appPort, data:report);
  exit(0);
}
exit(0);