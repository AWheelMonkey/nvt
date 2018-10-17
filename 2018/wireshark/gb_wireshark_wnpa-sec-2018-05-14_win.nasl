###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wnpa-sec-2018-05-14_win.nasl 8944 2018-02-26 08:33:13Z asteins $
#
# Wireshark Security Updates (wnpa-sec-2018-05 to -14) Windows
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
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
  script_oid("1.3.6.1.4.1.25623.1.0.112242");
  script_version("$Revision: 8944 $");
  script_cve_id("CVE-2018-7421", "CVE-2018-7419", "CVE-2018-7420", "CVE-2018-7418", "CVE-2018-7417",
      "CVE-2018-7337", "CVE-2018-7335", "CVE-2018-7336", "CVE-2018-7334", "CVE-2018-7332",
      "CVE-2018-7333", "CVE-2018-7330", "CVE-2018-7331", "CVE-2018-7328", "CVE-2018-7329",
      "CVE-2018-7326", "CVE-2018-7327", "CVE-2018-7324", "CVE-2018-7325", "CVE-2018-7323",
      "CVE-2018-7321", "CVE-2018-7322", "CVE-2018-7320");
  script_tag(name: "cvss_base", value:"5.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name: "last_modification", value: "$Date: 2018-02-26 09:33:13 +0100 (Mon, 26 Feb 2018) $");
  script_tag(name: "creation_date", value: "2018-02-26 09:15:00 +0100 (Mon, 26 Feb 2018)");

  script_name("Wireshark Security Updates (wnpa-sec-2018-05 to -14) Windows");

  script_tag(name: "summary", value: "This host is installed with Wireshark
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Get the installed version with the
  help of the detection NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "The following flaws exist:

      - The IEEE 802.11 dissector could crash (wnpa-sec-2018-05).

      - Multiple dissectors could go into large infinite loops. All ASN.1 BER dissectors, along with the DICOM, DMP, LLTD,
      OpenFlow, RELOAD, RPCoRDMA, RPKI-Router, S7COMM, SCCP, Thread, Thrift, USB, and WCCP dissectors were susceptible (wnpa-sec-2018-06).

      - The UMTS MAC dissector could crash (wnpa-sec-2018-07).

      - The DOCSIS dissector could crash (wnpa-sec-2018-08).

      - The FCP dissector could crash (wnpa-sec-2018-09).

      - The SIGCOMP dissector could crash (wnpa-sec-2018-10).

      - The pcapng file parser could crash (wnpa-sec-2018-11).

      - The IPMI dissector could crash (wnpa-sec-2018-12).

      - The SIGCOMP dissector could crash (wnpa-sec-2018-13).

      - The NBAP dissector could crash (wnpa-sec-2018-14)");

  script_tag(name: "impact", value: "It may be possible to make Wireshark crash by injecting a malformed packet
  onto the wire or by convincing someone to read a malformed packet trace file (wnpa-sec-2018-05, -07 to -14).

  It may be possible to make Wireshark consume excessive CPU resources by injecting
  a malformed packet onto the wire or by convincing someone to read a malformed packet trace file (wnpa-sec-2018-06).");

  script_tag(name: "affected", value: "Wireshark version 2.4.x to 2.4.4, 2.2.x to 2.2.12 on
  Windows.");

  script_tag(name: "solution", value: "Upgrade to Wireshark version 2.4.5, 2.2.12 or
  later. For updates refer to https://www.wireshark.org");

  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-05");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-06");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-07");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-08");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-09");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-10");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-11");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-12");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-13");
  script_xref(name: "URL", value: "https://www.wireshark.org/security/wnpa-sec-2018-14");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
vers = infos['version'];
path = infos['location'];

if (version_in_range(version:vers, test_version:"2.2.0", test_version2:"2.2.12")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"2.2.13", install_path:path);
  security_message(data:report, port:0);
  exit(0);
}

if (version_in_range(version:vers, test_version:"2.4.0", test_version2:"2.4.4")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"2.4.5", install_path:path);
  security_message(data:report, port:0);
  exit(0);
}

exit(0);
