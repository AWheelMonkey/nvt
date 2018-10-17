###############################################################################                                                                  
# OpenVAS Vulnerability Test
# $Id: gb_kaspersky_password_manager_dll_hijacking_code_exec_vuln_may18_win.nasl 9965 2018-05-25 14:06:08Z cfischer $
#
# Kaspersky Password Manager DLL Hijacking Code Execution Vulnerability May18 (Windows)
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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

CPE = "cpe:/a:kaspersky:passwordmanager";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812871");
  script_version("$Revision: 9965 $");
  script_cve_id("CVE-2018-6306");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-25 16:06:08 +0200 (Fri, 25 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-04 11:31:27 +0530 (Fri, 04 May 2018)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Kaspersky Password Manager DLL Hijacking Code Execution Vulnerability May18 (Windows)");

  script_tag(name:"summary", value:"This host is running Kaspersky Password
  Manager and is prone to DLL hijacking.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists in an unknown function of
  the component DLL Handler.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to load a malicious DLL into the installer process and thereafter allow
  unauthorized code execution from the DLL.

  Impact Level: Application");

  script_tag(name:"affected", value:"Kaspersky Password Manager versions before
  8.0.6.538 on Windows.");

  script_tag(name:"solution", value:"Upgrade to version 9.0.0.728 or later. For
  updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.kaspersky.com/vulnerability.aspx?el=12430#120418");
  script_xref(name:"URL", value:"https://www.kaspersky.co.in/password-manager");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_kaspersky_password_manager_detect_win.nasl");
  script_mandatory_keys("Kaspersky/PasswordManager/Ver, Kaspersky/PasswordManager/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
kver = infos['version'];
kpath = infos['location'];

if(version_is_less(version:kver, test_version:"8.0.6.538"))
{
  report = report_fixed_ver(installed_version:kver, fixed_version:"9.0.0.728", install_path:kpath);
  security_message(data:report);
  exit(0);
}
exit(0);
