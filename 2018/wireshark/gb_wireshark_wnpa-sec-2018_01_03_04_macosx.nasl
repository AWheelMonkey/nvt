###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wnpa-sec-2018_01_03_04_macosx.nasl 12026 2018-10-23 08:22:54Z mmartin $
#
# Wireshark Security Updates (wnpa-sec-2018-04_wnpa-sec-2018-03_wnpa-sec-2018-01) MACOSX
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812633");
  script_version("$Revision: 12026 $");
  script_cve_id("CVE-2018-5335", "CVE-2018-5334", "CVE-2018-5336");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 10:22:54 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-01-16 13:14:57 +0530 (Tue, 16 Jan 2018)");
  script_name("Wireshark Security Updates (wnpa-sec-2018-04_wnpa-sec-2018-03_wnpa-sec-2018-01) MACOSX");

  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple denial-of-service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - The WCP dissector could crash.

  - The IxVeriWave file parser could crash.

  - The JSON, XML, NTP, XMPP, and GDB dissectors could crash.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to make wireshark crash.");

  script_tag(name:"affected", value:"Wireshark version 2.4.0 to 2.4.3, 2.2.0 to
  2.2.11 on Macosx.");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 2.4.4 or 2.2.12
  or later.");

  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-04");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-03");

  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-01");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

wirversion = "";

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
wirversion = infos['version'];
path = infos['location'];

if(version_in_range(version:wirversion, test_version:"2.4.0", test_version2:"2.4.3")){
   fix = "2.4.4";
}

else if(version_in_range(version:wirversion, test_version:"2.2.0", test_version2:"2.2.11")){
  fix = "2.2.12";
}

if(fix)
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:fix, install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
