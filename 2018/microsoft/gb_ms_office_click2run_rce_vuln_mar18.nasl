###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_click2run_rce_vuln_mar18.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Office 2016 Click-to-Run (C2R) Remote Code Execution Vulnerability - Mar18
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
  script_oid("1.3.6.1.4.1.25623.1.0.812997");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-0841");
  script_bugtraq_id(102957);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-03-23 11:36:25 +0530 (Fri, 23 Mar 2018)");
  script_name("Microsoft Office 2016 Click-to-Run (C2R) Remote Code Execution Vulnerability - Mar18");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Office Click-to-Run updates.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  Microsoft Excel software when the software fails to properly handle objects
  in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2016 Click-to-Run");

  script_tag(name:"solution", value:"Upgrade to latest version of Microsoft Office
  2016 Click-to-Run with respect to update channel used.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/office/mt465751");
  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-0841");
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

##1801 (Build 9001.2171)
if(UpdateChannel == "Monthly Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.9001.2171")){
    fix = "1801 (Build 9001.2171)";
  }
}
##1708 (Build 8431.2215)
else if(UpdateChannel == "Semi-Annual Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.8431.2215")){
    fix = "1708 (Build 8431.2215)";
  }
}
##Version 1708 (Build 8431.2215)
else if(UpdateChannel == "Semi-Annual Channel (Targeted)")
{
  if(version_is_less(version:officeVer, test_version:"16.0.8431.2215)")){
    fix = "1708 (Build 8431.2215)";
  }
}
##1705 (Build 8201.2258)
else if(UpdateChannel == "Deferred Channel")
{
  if(version_is_less(version:officeVer, test_version:"16.0.8201.2258")){
    fix = "1705 (Build 8201.2258)";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:officeVer, fixed_version:fix, install_path:officePath);
  security_message(data:report);
  exit(0);
}
exit(0);
