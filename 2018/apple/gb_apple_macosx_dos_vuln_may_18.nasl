###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_dos_vuln_may_18.nasl 9940 2018-05-23 15:46:09Z cfischer $
#
# Apple Mac OS X Denial of Service Vulnerability May-2018
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.813365");
  script_version("$Revision: 9940 $");
  script_cve_id("CVE-2016-7604");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-23 17:46:09 +0200 (Wed, 23 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-14 15:20:12 +0530 (Mon, 14 May 2018)");
  script_name("Apple Mac OS X Denial of Service Vulnerability May-2018");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to denial of service vulnerability.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"The flaw is due to a null pointer dereference
  error in state management.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to cause a system denial of service.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.12.1, 10.11.x through
  10.11.6.");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X version
  10.12.2 or later or apply appropriate security update for 10.11.x versions.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT207423");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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
if(!osVer || osVer !~ "^(10\.(11|12))" || "Mac OS X" >!< osName){
  exit(0);
}

if(osVer == "10.11.6")
{
  buildVer = get_kb_item("ssh/login/osx_build");
  if(!buildVer){
    exit(0);
  }
  ##https://en.wikipedia.org/wiki/OS_X_El_Capitan
  if(osVer == "10.11.6" && version_is_less_equal(version:buildVer, test_version:"15G1108"))
  {
    fix = "Apply patch from vendor";
    osVer = osVer + " Build " + buildVer;
  }
}

if(osVer =~ "^(10.11)")
{
  if(version_is_less(version:osVer, test_version:"10.11.6")){
    fix = "Upgrade to latest OS release 10.11.6 and apply patch from vendor";
  }
}

else if(osVer == "10.12.1"){
  fix = "10.12.2";
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
exit(0);
