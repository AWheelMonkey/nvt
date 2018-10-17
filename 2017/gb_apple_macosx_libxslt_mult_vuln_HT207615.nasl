###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_libxslt_mult_vuln_HT207615.nasl 9940 2018-05-23 15:46:09Z cfischer $
#
# Apple Mac OS X 'libxslt' Multiple Vulnerabilities-HT207615
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810981");
  script_version("$Revision: 9940 $");
  script_cve_id("CVE-2017-2477");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-23 17:46:09 +0200 (Wed, 23 May 2018) $");
  script_tag(name:"creation_date", value:"2017-05-19 12:01:54 +0530 (Fri, 19 May 2017)");
  script_name("Apple Mac OS X 'libxslt' Multiple Vulnerabilities-HT207615");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to multiple memory corruption vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws are due to multiple
  memory corruption issues causes due to poor memory handling.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to cause a denial of service (memory corruption) or possibly have unspecified
  other impact via unknown vectors.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.11.x through
  10.11.6");

  script_tag(name: "solution" , value:"Apply the appropriate patch from the vendor.
  For more updates refer to https://www.apple.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT207615");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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
if(!osVer || osVer !~ "^(10\.11)" || "Mac OS X" >!< osName){
  exit(0);
}

## 10.11.6 before build 15G1421 is vulnerable
##if 10.11.5 or less is running, update to 10.11.6 then apply patch
if(version_in_range(version:osVer, test_version:"10.11", test_version2:"10.11.5")){
  fix = "Upgrade to latest OS release and apply patch from vendor";
}

## applying patch on 10.11.6 will upgrade build version to 15G1421
else if(version_is_equal(version:osVer, test_version:"10.11.6"))
{
  ## SSH login and Checking for patch, build version
  sock = ssh_login_or_reuse_connection();
  if(!sock) {
    exit(0);
  }

  buildVer = chomp(ssh_cmd(socket:sock, cmd:"defaults read /System/" +
                                            "/Library/CoreServices/SystemVersion " +
                                            "ProductBuildVersion"));

  if(buildVer && version_is_less(version:buildVer, test_version:"15G1421"))
  {
    osVer = osVer + " Build " + buildVer;
    report = report_fixed_ver(installed_version:osVer, fixed_version:"Apply patch from vendor");
    security_message(data:report);
    exit(0);
  }
}
