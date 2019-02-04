###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_HT209341_02.nasl 12688 2018-12-06 13:59:18Z santu $
#
# Apple MacOSX Security Updates(HT209341)-02
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
  script_oid("1.3.6.1.4.1.25623.1.0.814605");
  script_version("$Revision: 12688 $");
  script_cve_id("CVE-2018-4463", "CVE-2018-4460", "CVE-2018-4461", "CVE-2018-4434",
                "CVE-2018-4303");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-06 14:59:18 +0100 (Thu, 06 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-06 11:30:15 +0530 (Thu, 06 Dec 2018)");
  script_name("Apple MacOSX Security Updates(HT209341)-02");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is
  present on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - A memory corruption issue was addressed with improved memory handling.

  - A denial of service issue was addressed by removing the vulnerable code.

  - A memory corruption issue was addressed with improved input validation.

  - An out-of-bounds read was addressed with improved input validation.

  - A type confusion issue was addressed with improved memory handling.");

  script_tag(name: "impact" , value:"Successful exploitation allow attackers to
  execute arbitrary code with system privilegeS, perform a denial of service
  attack and a local user may be able to cause unexpected system termination or
  read kernel memory. A malicious application may be able to elevate privileges.");

  script_tag(name: "affected" , value:"Apple Mac OS X versions,
  10.14.x through 10.14.1");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X 10.14.2 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT209341");
  script_xref(name : "URL" , value : "http://www.apple.com/support");
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
if(!osVer || "Mac OS X" >!< osName){
  exit(0);
}

if(version_in_range(version:osVer, test_version:"10.14",test_version2:"10.14.1"))
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:"10.14.2");
  security_message(data:report);
  exit(0);
}
exit(99);
