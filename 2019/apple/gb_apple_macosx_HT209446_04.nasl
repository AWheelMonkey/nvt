###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_HT209446_04.nasl 13245 2019-01-23 14:22:53Z santu $
#
# Apple MacOSX Security Updates(HT209446)-04
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814819");
  script_version("$Revision: 13245 $");
  script_cve_id("CVE-2018-4467", "CVE-2018-4452" );
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-23 15:22:53 +0100 (Wed, 23 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-23 10:31:27 +0530 (Wed, 23 Jan 2019)");
  script_name("Apple MacOSX Security Updates(HT209446)-04");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name: "insight" , value:"The multiple flaws exist due to,

  - A memory corruption issue which was addressed with improved state management.

  - A memory consumption issue which was addressed with improved memory handling.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to elevate privileges and execute arbitrary code with system
  privileges");

  script_tag(name: "affected" , value:"Apple Mac OS X versions
  10.12.x through 10.12.6 build 16G1710, 10.13.x through 10.13.6 build 17G4015");

  script_tag(name: "solution" , value:"Apply appropriate patch for 10.13.x or
  10.12.6 versions. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT209446");
  script_xref(name : "URL" , value : "http://www.apple.com/support");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}


include("version_func.inc");
include("ssh_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer|| osVer !~ "^10\.1[23]\."|| "Mac OS X" >!< osName){
  exit(0);
}

buildVer = get_kb_item("ssh/login/osx_build");

if(osVer =~ "^10.12")
{
  if(version_in_range(version:osVer, test_version:"10.12", test_version2:"10.12.5")){
    fix = "Upgrade to latest OS release and apply patch from vendor";
  }

  else if(osVer == "10.12.6")
  {
    if(osVer == "10.12.6" && version_is_less(version:buildVer, test_version:"16G1815"))
    {
      fix = "Apply patch from vendor";
      osVer = osVer + " Build " + buildVer;
    }
  }
}

if(osVer =~ "^10.13")
{
  if(version_in_range(version:osVer, test_version:"10.13", test_version2:"10.13.5")){
    fix = "Upgrade to latest OS release and apply patch from vendor";
  }

  else if(osVer == "10.13.6")
  {
    if(osVer == "10.13.6" && version_is_less(version:buildVer, test_version:"17G5019"))
    {
      fix = "Apply patch from vendor";
      osVer = osVer + " Build " + buildVer;
    }
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
exit(99);
