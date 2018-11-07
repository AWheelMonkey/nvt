###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln01_apr18_macosx.nasl 12026 2018-10-23 08:22:54Z mmartin $
#
# Wireshark Multiple Denial of Service Vulnerabilities -01 Apr18 (Mac OS X)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813069");
  script_version("$Revision: 12026 $");
  script_cve_id("CVE-2018-9257", "CVE-2018-9258");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 10:22:54 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-05 16:18:35 +0530 (Thu, 05 Apr 2018)");
  script_name("Wireshark Multiple Denial of Service Vulnerabilities -01 Apr18 (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  multiple input validation errors in 'epan/dissectors/packet-tcp.c' and
  'epan/dissectors/packet-cql.c' scripts.");

  script_tag(name:"impact", value:"Successful exploitation will make Wireshark
  crash by injecting malformed packets.");

  script_tag(name:"affected", value:"Wireshark version 2.4.0 to 2.4.5 on
  Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 2.4.6 or later.
  For updates refer to reference links.");

  script_xref(name:"URL", value:"https://www.wireshark.org/#download");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-21");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2018-22");

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
vers = infos['version'];
path = infos['location'];

if(version_in_range(version:vers, test_version:"2.4.0", test_version2:"2.4.5"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"2.4.6", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
