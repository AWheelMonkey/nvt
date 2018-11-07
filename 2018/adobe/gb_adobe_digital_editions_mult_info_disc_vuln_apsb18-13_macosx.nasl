##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_digital_editions_mult_info_disc_vuln_apsb18-13_macosx.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Adobe Digital Editions Multiple Information Disclosure Vulnerabilities-APSB18-13 (Mac OS X)
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

CPE = "cpe:/a:adobe:digital_editions";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813082");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-4925", "CVE-2018-4926");
  script_bugtraq_id(103712);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-12 11:46:01 +0530 (Thu, 12 Apr 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe Digital Editions Multiple Information Disclosure Vulnerabilities-APSB18-13 (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with Adobe Digital
  Edition and is prone to multiple information disclosure vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to an out-of-bounds
  read error and a stack overflow error caused by unsafe processing of specially
  crafted epub files.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to gain access to potentially sensitive information.");

  script_tag(name:"affected", value:"Adobe Digital Edition prior to 4.5.8 on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Digital Edition version
  4.5.8 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://www.adobe.com/in/solutions/ebook/digital-editions/download.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/Digital-Editions/apsb18-13.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_digital_edition_detect_macosx.nasl");
  script_mandatory_keys("AdobeDigitalEdition/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
digitalVer = infos['version'];
digitalPath = infos['location'];

if(version_is_less(version:digitalVer, test_version:"4.5.8"))
{
  report = report_fixed_ver(installed_version:digitalVer, fixed_version:"4.5.8", install_path:digitalPath);
  security_message(data:report);
  exit(0);
}
exit(0);
