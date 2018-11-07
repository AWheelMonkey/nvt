###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_HT209193_01.nasl 12203 2018-11-02 14:42:44Z bshakeel $
#
# Apple MacOSX Security Updates(HT209193)-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.814421");
  script_version("$Revision: 12203 $");
  script_cve_id("CVE-2017-0898", "CVE-2017-10784", "CVE-2017-14033", "CVE-2017-14064",
                "CVE-2017-17405", "CVE-2017-17742", "CVE-2018-6914", "CVE-2018-8777",
                "CVE-2018-8778", "CVE-2018-8779", "CVE-2018-8780", "CVE-2018-6797",
                "CVE-2018-4259", "CVE-2018-4286", "CVE-2018-4287", "CVE-2018-4288",
                "CVE-2018-4291", "CVE-2018-4334", "CVE-2018-4242");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-02 15:42:44 +0100 (Fri, 02 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-02 10:56:30 +0530 (Fri, 02 Nov 2018)");
  script_name("Apple MacOSX Security Updates(HT209193)-01");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - A memory corruption issue related to improper locking.

  - Multiple memory corruption issues related to improper memory handling.

  - Multiple issues in Perl related to improper memory handling.

  - Multiple issues in Ruby.");

  script_tag(name: "impact" , value:"Successful exploitation allow attackers to
  cause unexpected application termination or arbitrary code execution.");

  script_tag(name: "affected" , value:"Apple Mac OS X versions 10.12.x through 10.12.6
  build 16G1510");

  script_tag(name: "solution" , value:"Apply the appropriate patch for version 10.12.x.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT209193");
  script_xref(name : "URL" , value : "https://www.apple.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}

include("version_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer || osVer !~ "^(10\.12)" || "Mac OS X" >!< osName){
  exit(0);
}

if(version_in_range(version:osVer, test_version:"10.12", test_version2:"10.12.5")){
  fix = "Upgrade to latest OS release and apply patch from vendor";
}

else if(osVer == "10.12.6")
{
  buildVer = get_kb_item("ssh/login/osx_build");
  if(buildVer)
  {
    if(version_is_less(version:buildVer, test_version:"16G1618"))
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
exit(0);
