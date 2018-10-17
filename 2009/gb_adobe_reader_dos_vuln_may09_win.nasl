###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_dos_vuln_may09_win.nasl 8210 2017-12-21 10:26:31Z cfischer $
#
# Adobe Reader/Acrobat Denial of Service Vulnerability (May09) (Windows)
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (C) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800706");
  script_version("$Revision: 8210 $");
  script_cve_id("CVE-2009-1492");
  script_bugtraq_id(34736);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-21 11:26:31 +0100 (Thu, 21 Dec 2017) $");
  script_tag(name:"creation_date", value:"2009-05-11 08:41:11 +0200 (Mon, 11 May 2009)");
  script_name("Adobe Reader/Acrobat Denial of Service Vulnerability (May09)");

  tag_summary = "This host is installed with Adobe Reader/Acrobat and is prone to Denial of
Service vulnerability.";

  tag_vuldetect = "Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight = "This flaw is due to memory corruption error in 'getAnnots' methods in the
JavaScript API while processing malicious PDF files that calls this vulnerable
method with crafted integer arguments.";

  tag_impact = "Successful exploitation will let the attacker cause memory corruption or
denial of service.

Impact Level: System/Application";

  tag_affected = "Adobe Reader/Acrobat version 9.1 and prior on Windows.";

  tag_solution = "Upgrade to Adobe Reader/Acrobat version 9.3.2 or later,
For further updates refer, http://www.adobe.com";

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/34924");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/50145");
  script_xref(name : "URL" , value : "http://blogs.adobe.com/psirt/2009/04/update_on_adobe_reader_issue.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Air_or_Flash_or_Reader_or_Acrobat/Win/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:adobe:acrobat_reader";

if(readerVer = get_app_version(cpe:CPE, nofork:TRUE))
{
  # Grep for Adobe Reader version prior to 9.1
  if(version_is_less_equal(version:readerVer, test_version:"9.1")){
    security_message(0);
  }
}

CPE = "cpe:/a:adobe:acrobat";
if(acroVer = get_app_version(cpe:CPE))
{
  # Grep for Adobe Acrobat version prior to 9.1
  if(version_is_less_equal(version:acroVer, test_version:"9.1")){
    security_message(0);
    exit(0);
  }
}
