###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_unspecified_vuln01_apr16_win.nasl 12313 2018-11-12 08:53:51Z asteins $
#
# Oracle Virtualbox Unspecified Vulnerability-01 Apr16 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807808");
  script_version("$Revision: 12313 $");
  script_cve_id("CVE-2016-0678");
  script_tag(name:"cvss_base", value:"4.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 09:53:51 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-04-25 17:04:49 +0530 (Mon, 25 Apr 2016)");
  script_name("Oracle Virtualbox Unspecified Vulnerability-01 Apr16 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Oracle VM
  VirtualBox and is prone to unspecified vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to some unspecified
  error.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attackers to have an impact on confidentiality, integrity, and availability.");

  script_tag(name:"affected", value:"VirtualBox versions prior to 5.0.18
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to Oracle VirtualBox version
  5.0.18 or later on Windows.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpuapr2016v3-2985753.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");
  script_xref(name:"URL", value:"https://www.virtualbox.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!virtualVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:virtualVer, test_version:"5.0.0", test_version2:"5.0.17"))
{
  report = report_fixed_ver(installed_version:virtualVer, fixed_version:"5.0.18");
  security_message(data:report);
  exit(0);
}
