###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_acrobat_apsb17-01_win.nasl 8210 2017-12-21 10:26:31Z cfischer $
#
# Adobe Acrobat Security Updates(apsb17-01)-Windows
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810332");
  script_version("$Revision: 8210 $");
  script_cve_id("CVE-2017-2939", "CVE-2017-2940", "CVE-2017-2941", "CVE-2017-2942", 
                "CVE-2017-2943", "CVE-2017-2944", "CVE-2017-2945", "CVE-2017-2946", 
                "CVE-2017-2947", "CVE-2017-2948", "CVE-2017-2949", "CVE-2017-2950", 
                "CVE-2017-2951", "CVE-2017-2952", "CVE-2017-2953", "CVE-2017-2954", 
                "CVE-2017-2955", "CVE-2017-2956", "CVE-2017-2957", "CVE-2017-2958", 
                "CVE-2017-2959", "CVE-2017-2960", "CVE-2017-2961", "CVE-2017-2962", 
                "CVE-2017-2963", "CVE-2017-2964", "CVE-2017-2965", "CVE-2017-2966", 
                "CVE-2017-2967", "CVE-2017-2970", "CVE-2017-2971", "CVE-2017-2972",
                "CVE-2017-3009", "CVE-2017-3010");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-21 11:26:31 +0100 (Thu, 21 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-01-11 08:28:14 +0530 (Wed, 11 Jan 2017)");
  script_name("Adobe Acrobat Security Updates(apsb17-01)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Acrobat
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - A type confusion vulnerability.
  - An use-after-free vulnerabilities.
  - The heap buffer overflow vulnerabilities.
  - The buffer overflow vulnerabilities.
  - The memory corruption vulnerabilities.");

  script_tag(name:"impact" , value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to do code execution,
  security bypass and information disclosure.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Acrobat version 11.x before
  11.0.19 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Acrobat version
  11.0.19 or later.
  For updates refer to http://www.adobe.com/in/products/acrobat.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/acrobat/apsb17-01.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Acrobat/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
readerVer = "";

## Get version
if(!readerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check Adobe Reader vulnerable versions
if(version_in_range(version:readerVer, test_version:"11.0", test_version2:"11.0.18"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"11.0.19");
  security_message(data:report);
  exit(0);
}