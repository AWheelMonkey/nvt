###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_digital_editions_mult_bof_vuln_feb17_macosx.nasl 5383 2017-02-21 09:27:02Z teissa $
#
# Adobe Digital Editions Multiple Buffer Overflow Vulnerabilities Feb17 (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:adobe:digital_editions";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810601");
  script_version("$Revision: 5383 $");
  script_cve_id("CVE-2017-2973", "CVE-2017-2974", "CVE-2017-2975", "CVE-2017-2976",
                "CVE-2017-2977", "CVE-2017-2978", "CVE-2017-2979", "CVE-2017-2980",
                "CVE-2017-2981");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-21 10:27:02 +0100 (Tue, 21 Feb 2017) $");
  script_tag(name:"creation_date", value:"2017-02-15 09:38:58 +0530 (Wed, 15 Feb 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe Digital Editions Multiple Buffer Overflow Vulnerabilities Feb17 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Adobe Digital Edition
  and is prone to multiple buffer overflow vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"Multiple flaws are due to,
  - A heap buffer overflow error.
  - Multiple memory leak errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to trigger a buffer overflow and execute arbitrary code on the
  target system. Also buffer overflow could lead to a memory leak.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Digital Edition prior to 4.5.4 on 
  Mac OS X");

  script_tag(name: "solution" , value:"Upgrade to Adobe Digital Edition version
  4.5.4 or later. For updates refer to http://www.adobe.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1037816");
  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/Digital-Editions/apsb17-05.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_digital_edition_detect_macosx.nasl");
  script_mandatory_keys("AdobeDigitalEdition/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
digitalVer = "";

## Get version
if(!digitalVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check Adobe Digital Edition vulnerable versions
if(version_is_less(version:digitalVer, test_version:"4.5.4"))
{
  report = report_fixed_ver(installed_version:digitalVer, fixed_version:"4.5.4");
  security_message(data:report);
  exit(0);
}
