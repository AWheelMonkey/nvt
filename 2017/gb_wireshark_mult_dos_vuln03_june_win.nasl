###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln03_june_win.nasl 9508 2018-04-17 10:00:46Z ckuersteiner $
#
# Wireshark Multiple Denial-of-Service Vulnerabilities-03 June17 (Windows)
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810962");
  script_version("$Revision: 9508 $");
  script_cve_id("CVE-2017-9616", "CVE-2017-9617");
  script_bugtraq_id(99087, 99085);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-04-17 12:00:46 +0200 (Tue, 17 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-06-27 16:34:23 +0530 (Tue, 27 Jun 2017)");
  script_name("Wireshark Multiple Denial-of-Service Vulnerabilities-03 June17 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws exists due to,

  - An error in 'epan/dissectors/file-mp4.c' script which fails to properly 
    handle certain types of packets.

  - An error in in the 'dissect_daap_one_tag' function in 'epan/dissectors/packet-daap.c' 
    script in the DAAP dissector.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote 
  attackers to crash the affected application, resulting in denial-of-service 
  conditions.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Wireshark prior version 2.2.14 on Windows");

  script_tag(name: "solution" , value: "Update to version 2.2.14 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=13777");
  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=13799");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!wirversion = get_app_version(cpe:CPE))
  exit(0);

if(version_is_less(version: wirversion, test_version: "2.2.14")) {
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.2.14");
  security_message(data:report);
  exit(0);
}

exit(99);
