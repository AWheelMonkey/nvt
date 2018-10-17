###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln01_nov14_win.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Wireshark Multiple Denial-of-Service Vulnerability-01 Nov14 (Windows)
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804895");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-8714", "CVE-2014-8713", "CVE-2014-8712", "CVE-2014-8711");
  script_bugtraq_id(71072, 71073, 71071, 71070);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-11-28 11:48:46 +0530 (Fri, 28 Nov 2014)");
  script_name("Wireshark Multiple Denial-of-Service Vulnerability-01 Nov14 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An error within the AMQP dissector.

  - Two errors within the NCP dissector.

  - An error within the TN5250 dissector.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to conduct denial of service attack.");

  script_tag(name:"affected", value:"Wireshark version 1.10.x
  before 1.10.11 and 1.12.x before 1.12.2 on Windows");

  script_tag(name:"solution", value:"Upgrade to version 1.12.2, 1.10.11 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://secunia.com/advisories/62367");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2014-21.html");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2014-22.html");
  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2014-23.html");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!version = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:version, test_version:"1.10.0", test_version2:"1.10.10") ||
   version_in_range(version:version, test_version:"1.12.0", test_version2:"1.12.1"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
