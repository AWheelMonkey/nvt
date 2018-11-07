###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_indesign_code_exec_n_priv_esc_vuln_apsb18-11_win.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Adobe InDesign Code Execution And Privilege Escalation Vulnerabilities-APSB18-11 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813084");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-4927", "CVE-2018-4928");
  script_bugtraq_id(103716, 103714);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-12 15:20:31 +0530 (Thu, 12 Apr 2018)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe InDesign Code Execution And Privilege Escalation Vulnerabilities-APSB18-11 (Windows)");

  script_tag(name:"summary", value:"This host is running Adobe InDesign and is
  prone to code execution and privilege escalation vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to memory corruption
  error and untrusted search path errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the user running the
  affected applications and also to escalate privileges.");

  script_tag(name:"affected", value:"Adobe InDesign CC versions 13.0 and earlier on Windows.");

  script_tag(name:"solution", value:"Upgrade to version 13.1 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/indesign/apsb18-11.html");
  script_xref(name:"URL", value:"https://www.adobe.com/in/products/indesign/free-trial-download.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_indesign_detect.nasl");
  script_mandatory_keys("Adobe/InDesign/Ver");
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
