###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_mult_rce_vuln_aug18_macosx.nasl 10988 2018-08-15 14:37:17Z santu $
#
# Microsoft Office Multiple Vulnerabilities-August18 (Mac OS X)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813296");
  script_version("$Revision: 10988 $");
  script_cve_id("CVE-2018-8375", "CVE-2018-8382", "CVE-2018-8412");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 16:37:17 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 16:04:00 +0530 (Wed, 15 Aug 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Multiple Vulnerabilities-August18 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update for Microsoft Office 2016 on Mac OSX according to Microsoft security
  update August 2018");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect nvt and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Microsoft Excel software fails to properly handle objects in memory.

  - Microsoft AutoUpdate (MAU) application for Mac improperly validates updates
    before executing them.

  - Microsoft Excel improperly discloses the contents of its memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to run arbitrary code in the context of the current user and compromise the user's
  computer or data.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2016 on Mac OS X");

  script_tag(name:"solution", value:"Upgrade to Microsoft Office 2016 version
  16.16.0 (Build 18081201) or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/officeupdates/release-notes-office-for-mac");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  exit(0);
}

include("version_func.inc");

if(!offVer = get_kb_item("MS/Office/MacOSX/Ver")){
  exit(0);
}

if(offVer =~ "^((15|16)\.)" && version_is_less(version:offVer, test_version:"16.16.0"))
{
  report = report_fixed_ver(installed_version:offVer, fixed_version:"16.16.0");
  security_message(data:report);
  exit(0);
}
