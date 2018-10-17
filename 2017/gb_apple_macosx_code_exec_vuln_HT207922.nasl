###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_code_exec_vuln_HT207922.nasl 9846 2018-05-15 14:10:09Z santu $
#
# Apple Mac OS X Code Execution Vulnerability HT207922
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
  script_oid("1.3.6.1.4.1.25623.1.0.811537");
  script_version("$Revision: 9846 $");
  script_cve_id("CVE-2017-7047");
  script_bugtraq_id(99883);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-15 16:10:09 +0200 (Tue, 15 May 2018) $");
  script_tag(name:"creation_date", value:"2017-07-20 12:23:38 +0530 (Thu, 20 Jul 2017)");
  script_name("Apple Mac OS X Code Execution Vulnerability HT207922");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to code execution vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to a memory corruption issue
  in libxpc component.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to execute arbitrary code with system privileges.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.12.x before 
  10.12.6 and 10.11.x through 10.11.6.");

  script_tag(name: "solution" , value:"For Apple Mac OS X version 10.12.x before
  10.12.6 update to 10.12.6 and for versions 10.11.x through 10.11.6 apply the
  appropriate security patch. For updates refer to reference links");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT207922");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}


include("version_func.inc");
include("ssh_func.inc");

## Variable Initialization
osName = "";
osVer = "";

## Get the OS name
osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

## Get the OS Version
osVer = get_kb_item("ssh/login/osx_version");
if(!osVer || osVer !~ "^(10\.(11|12))" || "Mac OS X" >!< osName){
  exit(0);
}

## Check the affected OS versions
if(version_in_range(version:osVer, test_version:"10.12", test_version2:"10.12.5")){
  fix = "10.12.6";
}

else if(osVer =~ "^(10\.11)")
{
  if(version_in_range(version:osVer, test_version:"10.11", test_version2:"10.11.5")){
    fix = "Upgrade to latest OS release and apply patch from vendor";
  }

  ## applying patch on 10.11.6 will upgrade build version to 15G1611
  ## https://en.wikipedia.org/wiki/OS_X_El_Capitan
  else if(version_is_equal(version:osVer, test_version:"10.11.6"))
  {
    ## SSH login and Checking for patch, build version
    sock = ssh_login_or_reuse_connection();
    if(!sock) {
      exit(0);
    }

    ## Get the build version of macosx
    buildVer = chomp(ssh_cmd(socket:sock, cmd:"defaults read /System/" +
                                              "/Library/CoreServices/SystemVersion " +
                                              "ProductBuildVersion"));

    if(buildVer && version_is_less(version:buildVer, test_version:"15G1611")){
      fix = "Apply patch from vendor";
    }
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}
