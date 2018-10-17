###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_click2run_mult_vuln_may18.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Office 2016 Click-to-Run (C2R) Multiple Vulnerabilities-May18
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813180");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-8147", "CVE-2018-8148", "CVE-2018-8162", "CVE-2018-8163",
                "CVE-2018-8150", "CVE-2018-8157", "CVE-2018-8158");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-05-09 11:32:57 +0530 (Wed, 09 May 2018)");
  script_name("Microsoft Office 2016 Click-to-Run (C2R) Multiple Vulnerabilities-May18");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Office Click-to-Run updates.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple errors in Microsoft Excel software when the software fails to properly
    handle objects in memory.

  - An error in Microsoft Excel improperly discloses the contents of its memory.

  - An error in the Microsoft Outlook attachment block filter which does not
    properly handle attachments.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user, gain access to
  potentially sensitive information and bypass security feature mechanism.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2016 Click-to-Run");

  script_tag(name:"solution", value:"Upgrade to latest version of Microsoft Office
  2016 Click-to-Run with respect to update channel used. For details refer to
  Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/office/mt465751");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_office_click2run_detect_win.nasl");
  script_mandatory_keys("MS/Off/C2R/Ver", "MS/Office/C2R/UpdateChannel");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

officeVer = get_kb_item("MS/Off/C2R/Ver");
UpdateChannel = get_kb_item("MS/Office/C2R/UpdateChannel");
officePath = get_kb_item("MS/Off/C2R/InstallPath");

if(!(officeVer =~ "^(16\.)")){
  exit(0);
}

##1804 (Build 9226.2126)
if(UpdateChannel == "Monthly Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.9226.2126")){
    fix = "1804 (Build 9226.2126";
  }
}
##1708 (Build 8431.2250)
else if(UpdateChannel == "Semi-Annual Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.8431.2250")){
    fix = "1708 (Build 8431.2250)";
  }
}
##1803 (Build 9126.2191)
else if(UpdateChannel == "Semi-Annual Channel (Targeted)")
{
  if(version_is_less(version:officeVer, test_version:"16.0.9126.2191)")){
    fix = "1803 (Build 9126.2191)";
  }
}
##1705 (Build 8201.2278)
else if(UpdateChannel == "Deferred Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.8201.2278")){
    fix = "1705 (Build 8201.2278)";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:officeVer, fixed_version:fix, install_path:officePath);
  security_message(data:report);
  exit(0);
}
exit(99);
