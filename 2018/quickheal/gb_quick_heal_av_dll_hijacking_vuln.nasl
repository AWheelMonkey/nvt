###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_quick_heal_av_dll_hijacking_vuln.nasl 12924 2019-01-02 09:25:12Z ckuersteiner $
#
# Quick Heal Anti-Virus Pro DLL Hijacking Vulnerability
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

CPE = "cpe:/a:quickheal:antivirus_pro";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813594");
  script_version("$Revision: 12924 $");
  script_cve_id("CVE-2018-8090");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-02 10:25:12 +0100 (Wed, 02 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-08-02 16:39:04 +0530 (Thu, 02 Aug 2018)");

  script_name("Quick Heal Anti-Virus Pro DLL Hijacking Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Quick Heal
  Anti-Virus Pro and is prone to DLL hijacking vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to insufficient validation on library loading.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to load insecure library, hijack DLL and execute arbitrary code.");

  script_tag(name:"affected", value:"Quick Heal Anti-Virus Pro version 10.0.0.37");

  script_tag(name:"solution", value:"Update to version 10.0.1.46 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://github.com/kernelm0de/CVE-2018-8090");
  script_xref(name:"URL", value:"http://www.quickheal.com/quick-heal-antivirus-updates-download");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_quick_heal_av_detect.nasl");
  script_mandatory_keys("QuickHeal/Antivirus/Pro");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
quickVer = infos['version'];
quickPath = infos['location'];

if(version_is_equal(version:quickVer, test_version:"10.0.0.37"))
{
  report = report_fixed_ver(installed_version:quickVer, fixed_version:"10.0.1.46", install_path:quickPath);
  security_message(data:report);
  exit(0);
}
