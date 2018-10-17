###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_indesign_code_exec_n_priv_esc_vuln_apsb18-11_macosx.nasl 10349 2018-06-27 15:50:28Z cfischer $
#
# Adobe InDesign Code Execution And Privilege Escalation Vulnerabilities - APSB18-11 (Mac OS X)
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
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

CPE = "cpe:/a:adobe:indesign_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813085");
  script_version("$Revision: 10349 $");
  script_cve_id("CVE-2018-4927", "CVE-2018-4928");
  script_bugtraq_id(103716, 103714);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-27 17:50:28 +0200 (Wed, 27 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-04-12 15:22:31 +0530 (Thu, 12 Apr 2018)");
  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_name("Adobe InDesign Code Execution And Privilege Escalation Vulnerabilities - APSB18-11 (Mac OS X)");

  script_tag(name:"summary", value:"This host is running Adobe InDesign and is
  prone to code execution and privilege escalation vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to memory corruption
  error and untrusted search path errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the user running the
  affected applications and also to escalate privileges.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Adobe InDesign CC versions 13.0 and earlier on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to version 13.1 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/indesign/apsb18-11.html");
  script_xref(name:"URL", value:"https://www.adobe.com/in/products/indesign/free-trial-download.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_indesign_server_detect_macosx.nasl");
  script_mandatory_keys("InDesign/Server/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
desVer = infos['version'];
desPath = infos['location'];

if(version_is_less(version:desVer, test_version:"13.1"))
{
  report = report_fixed_ver(installed_version:desVer, fixed_version:"13.1", install_path:desPath);
  security_message(data:report);
  exit(0);
}
exit(0);
