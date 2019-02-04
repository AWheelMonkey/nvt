###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nodejs_debugger_privilege_escalation_vuln_macosx.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# Node.js 'debugger' Privilege Escalation Vulnerability-(Mac OS X)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.814520");
  script_version("$Revision: 12938 $");
  script_cve_id("CVE-2018-12120");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-29 13:36:34 +0530 (Thu, 29 Nov 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Node.js 'debugger' Privilege Escalation Vulnerability-(Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with Node.js and is
  prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists in due to an error in 'Debugger'.
  Debugger port 5858 listens on any interface by default, When the debugger
  is enabled with 'node --debug' or 'node debug'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct spoofing attacks.");

  script_tag(name:"affected", value:"Node.js versions prior to 6.15.0 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Node.js version 6.15.0 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://nodejs.org/en/blog/vulnerability/november-2018-security-releases");
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

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
nodejsVer = infos['version'];
appPath = infos['location'];

if(version_is_less(version:nodejsVer, test_version:"6.15.0"))
{
  report = report_fixed_ver(installed_version:nodejsVer, fixed_version:"6.15.0", install_path:appPath);
  security_message(data:report);
  exit(0);
}

exit(99);