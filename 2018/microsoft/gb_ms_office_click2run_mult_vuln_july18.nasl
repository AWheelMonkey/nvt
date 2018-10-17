###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_click2run_mult_vuln_july18.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Office 2016 Click-to-Run (C2R) Multiple Vulnerabilities-July18
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813257");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2018-8310", "CVE-2018-8281", "CVE-2018-8312");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-11 14:31:54 +0530 (Wed, 11 Jul 2018)");
  script_name("Microsoft Office 2016 Click-to-Run (C2R) Multiple Vulnerabilities-July18");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Office Click-to-Run updates.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple errors in Microsoft Excel software when the software fails to properly
    handle objects in memory.

  - An error in Microsoft Excel which improperly discloses the contents of its
    memory.

  - An error in the Microsoft Outlook when Microsoft Outlook does not validate
    attachment headers properly");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user, gain access to
  potentially sensitive information and gain elevated privileges.

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

##1806 (Build 10228.20104)
if(UpdateChannel == "Monthly Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.10228.20104")){
    fix = "1806 (Build 10228.20104)";
  }
}

##1803 (Build 9126.2259)
else if(UpdateChannel == "Semi-Annual Channel" || UpdateChannel = "Semi-Annual Channel (Targeted)")
{
  if(version_is_less(version:officeVer, test_version:"16.0.9126.2259")){
    fix = "1803 (Build 9126.2259";
  }
}

##TODO: need to confirm this detection
##1708 (Build 8431.2280)
#else if(UpdateChannel == "Semi-Annual Extended")
#{
# if(version_is_less(version:officeVer, test_version:"16.0.8431.2280")){
#    fix = "1708 (Build 8431.2280)";
#  }
#}

if(fix)
{
  report = report_fixed_ver(installed_version:officeVer, fixed_version:fix, install_path:officePath);
  security_message(data:report);
  exit(0);
}
exit(99);
