###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wnpa-sec-2017-46_wnpa-sec-2017-45_macosx.nasl 7604 2017-11-01 06:48:12Z asteins $
#
# Wireshark Security Updates (wnpa-sec-2017-46_wnpa-sec-2017-45)-MACOSX
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811945");
  script_version("$Revision: 7604 $");
  script_cve_id("CVE-2017-15189", "CVE-2017-15190" );
  script_bugtraq_id(101228, 101229);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-01 07:48:12 +0100 (Wed, 01 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-12 13:42:39 +0530 (Thu, 12 Oct 2017)");
  script_name("Wireshark Security Updates (wnpa-sec-2017-46_wnpa-sec-2017-45)-MACOSX");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - The DOCSIS dissector could go into an infinite loop.

  - The RTSP dissector could crash.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to make Wireshark consume excessive
  CPU resources by injecting a malformed packet onto the wire or by convincing
  someone to read a malformed packet trace file. It may be possible to make
  Wireshark crash by injecting a malformed packet onto the wire or by convincing
  someone to read a malformed packet trace file.

  Impact Level: Application.");

  script_tag(name: "affected" , value: "Wireshark version 2.4.0 to 2.4.1
  on MACOSX.");

  script_tag(name: "solution" , value: "Upgrade to Wireshark version 2.4.2 or
  later. For updates refer to https://www.wireshark.org");

  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2017-46");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2017-45");
 
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirversion = "";

## Get the version
if(!wirversion = get_app_version(cpe:CPE)){
  exit(0);
}

if(wirversion =~ "^(2\.4)" )
{
  if(version_in_range(version:wirversion, test_version:"2.4.0", test_version2:"2.4.1"))
  {
    report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.4.2");
    security_message(data:report);
    exit(0);
  }
}
exit(0);
