###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_mult_vuln03_HT208465.nasl 9762 2018-05-09 02:09:11Z ckuersteiner $
#
# Apple Mac OS X Multiple Vulnerabilities-03 (HT208465)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812664");
  script_version("$Revision: 9762 $");
  script_cve_id("CVE-2018-4094", "CVE-2018-4097", "CVE-2018-4100", "CVE-2018-4086");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-09 04:09:11 +0200 (Wed, 09 May 2018) $");
  script_tag(name:"creation_date", value:"2018-01-24 11:47:13 +0530 (Wed, 24 Jan 2018)");
  script_name("Apple Mac OS X Multiple Vulnerabilities-03 (HT208465)");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - A memory corruption issues.

  - A logic issue.

  - A resource exhaustion issue.

  - A certificate evaluation issue in the handling of name constraints.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an attacker
  to execute arbitrary code on the affected system, lead to application denial of
  service, use certificate having name constraints applied incorrectly.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.13.x prior to
  10.13.3, 10.12.x through 10.12.6 before build 16G1212");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X version
  10.13.3 or apply the appropriate patch. For updates refer to,
  https://www.apple.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT208465");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}

include("version_func.inc");

osName = "";
osVer = "";

osName = get_kb_item("ssh/login/osx_name");
if(!osName || "Mac OS X" >!< osName){
  exit(0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer || osVer !~ "^(10\.(12|13))"){
  exit(0);
}

if(osVer =~ "^(10\.12)")
{
  if(version_in_range(version:osVer, test_version:"10.12", test_version2:"10.12.5")){
    fix = "Upgrade to latest OS release and apply patch from vendor";
  }
  else if(osVer == "10.12.6")
  {
    buildVer = get_kb_item("ssh/login/osx_build");
    ##https://en.wikipedia.org/wiki/MacOS_Sierra
    if(buildVer && (osVer == "10.12.6" && version_is_less(version:buildVer, test_version:"16G1212")))
    {
      fix = "Apply patch from vendor";
      osVer = osVer + " Build " + buildVer;
    }
  }
}

else if(version_in_range(version:osVer, test_version:"10.13", test_version2:"10.13.2")){
  fix = "10.13.3";
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
exit(0);
