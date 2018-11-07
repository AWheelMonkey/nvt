###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wnpa-sec-2018-25_wnpa-sec-2018-30_02_macosx.nasl 12026 2018-10-23 08:22:54Z mmartin $
#
# Wireshark Security Updates (wnpa-sec-2018-32_wnpa-sec-2018-27_wnpa-sec-2018-26) (MACOSX)
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813373");
  script_version("$Revision: 12026 $");
  script_cve_id("CVE-2018-11361", "CVE-2018-11355", "CVE-2018-11354");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 10:22:54 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-05-23 12:18:22 +0530 (Wed, 23 May 2018)");
  script_name("Wireshark Security Updates (wnpa-sec-2018-32_wnpa-sec-2018-27_wnpa-sec-2018-26) (MACOSX)");

  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A buffer overflow during FTE processing in 'epan/crypt/dot11decrypt.c'
    script.

  - A buffer overflow error in 'epan/dissectors/packet-rtcp.c' script.

  - An error in string handling in 'epan/dissectors/packet-ieee1905.c' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to make Wireshark crash by injecting a malformed packet onto the wire or by
  convincing someone to read a malformed packet trace file.");

  script_tag(name:"affected", value:"Wireshark version 2.6.0 on Macosx.");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 2.6.1 or later.
  For updates refer to Reference links.");

  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-32");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-27");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-26");
  script_xref(name:"URL", value:"https://www.wireshark.org/download.html");

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

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
wirversion = infos['version'];
path = infos['location'];

if(wirversion == "2.6.0")
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.6.1", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
