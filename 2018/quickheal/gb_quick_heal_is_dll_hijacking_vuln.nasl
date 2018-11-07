###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_quick_heal_is_dll_hijacking_vuln.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Quick Heal Internet Security DLL Hijacking Vulnerability
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
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

CPE = "cpe:/a:quick_heal:internet_security";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813593");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-8090");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-02 16:39:04 +0530 (Thu, 02 Aug 2018)");
  script_name("Quick Heal Internet Security DLL Hijacking Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Quick Heal
  Internet Security and is prone to DLL hijacking vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an insufficient
  validation on library loading.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to load insecure library, hijack DLL and execute arbitrary code.");

  script_tag(name:"affected", value:"Quick Heal Internet Security version 10.0.0.37");

  script_tag(name:"solution", value:"No known solution is available as of 02nd
  August, 2018. Information regarding this issue will be updated once solution
  details are available. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://github.com/kernelm0de/CVE-2018-8090");
  script_xref(name:"URL", value:"http://www.quickheal.com/quick-heal-antivirus-updates-download");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_quick_heal_is_detect.nasl");
  script_mandatory_keys("QuickHeal/InternetSecurity/Installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
quickVer = infos['version'];
quickPath = infos['location'];

if(version_is_equal(version:quickVer, test_version:"10.0.0.37"))
{
  report = report_fixed_ver(installed_version:quickVer, fixed_version:"NoneAvailable", install_path:quickPath);
  security_message(data:report);
  exit(0);
}
exit(99);
