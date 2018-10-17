###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_coap_n_steam_ihs_disc_diss_dos_vuln_macosx.nasl 11902 2018-10-15 09:26:53Z santu $
#
# Wireshark Steam IHS Discovery/CoAP Dissector DoS Vulnerabilities-MACOSX
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.814134");
  script_version("$Revision: 11902 $");
  script_cve_id("CVE-2018-18225", "CVE-2018-18226");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 11:26:53 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-15 12:30:47 +0530 (Mon, 15 Oct 2018)");
  script_name("Wireshark Steam IHS Discovery/CoAP Dissector DoS Vulnerabilities-MACOSX");

  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaws are due to insufficient validation
  of user-supplied input processed by Steam In-Home Streaming (IHS) Discovery
  and Constrained Application Protocol (CoAP) dissector components.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to cause a denial of service (DoS) condition on a targeted system.");

  script_tag(name:"affected", value:"Wireshark version 2.6.0 to 2.6.3 on MACOSX.");

  script_tag(name:"solution", value:"Upgrade to Wireshark 2.6.4 or later.
  For updates refer to Reference links.");

  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-48.html");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-49.html");
  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/viewAlert.x?alertId=59009");
  script_xref(name:"URL", value:"https://tools.cisco.com/security/center/viewAlert.x?alertId=59008");
  script_xref(name:"URL", value:"https://www.wireshark.org");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
wirversion = infos['version'];
path = infos['location'];

if(version_in_range(version:wirversion, test_version:"2.6.0", test_version2:"2.6.3"))
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.6.4", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);
