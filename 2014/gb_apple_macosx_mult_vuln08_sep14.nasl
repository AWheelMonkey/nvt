###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_mult_vuln08_sep14.nasl 9935 2018-05-23 13:15:24Z santu $
#
# Apple Mac OS X Multiple Vulnerabilities -08 Sep14
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804854");
  script_version("$Revision: 9935 $");
  script_cve_id("CVE-2013-5139", "CVE-2013-5178");
  script_bugtraq_id(62536, 63343);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-23 15:15:24 +0200 (Wed, 23 May 2018) $");
  script_tag(name:"creation_date", value:"2014-09-22 18:58:08 +0530 (Mon, 22 Sep 2014)");

  script_name("Apple Mac OS X Multiple Vulnerabilities -08 Sep14");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to,
  - A boundary error within the IOSerialFamily component.
  - An error when handling certain unicode characters within the LaunchServices.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to conduct denial of service, arbitrary code execution and spoof a different
  extension.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.8.x through
  10.8.5 and 10.7.x before 10.7.5");

  script_tag(name: "solution" , value:"Run Mac Updates. For more information
  refer link, http://support.apple.com/kb/HT6150

  NOTE: Please ignore the warning if the update is already applied.");
  script_tag(name:"qod", value:"30"); ## Build information is not available
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://support.apple.com/kb/HT6150");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/55446");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
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
if(!osVer){
 exit(0);
}

if("Mac OS X" >< osName)
{
  if(version_in_range(version:osVer, test_version:"10.8.0", test_version2:"10.8.5")||
     version_in_range(version:osVer, test_version:"10.7.0", test_version2:"10.7.5"))
  {
    security_message(0);
    exit(0);
  }
}
