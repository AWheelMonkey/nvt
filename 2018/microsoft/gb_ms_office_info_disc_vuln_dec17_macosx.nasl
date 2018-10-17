###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_info_disc_vuln_dec17_macosx.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Office PowerPoint Information Disclosure Vulnerability - Dec17 (Mac OS X)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812728");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2017-11934");
  script_bugtraq_id(102064);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-01-11 14:22:59 +0530 (Thu, 11 Jan 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office PowerPoint Information Disclosure Vulnerability - Dec17 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update for Microsoft Office 2016 on Mac OSX according to Microsoft security
  update December 2017");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect nvt and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to the way certain functions
  handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to obtain sensitive information that may aid in launching further attacks.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Office 2016 on Mac OS X");

  script_tag(name:"solution", value:"Apply the patch from below link,
  https://support.office.com/en-us/article/Release-notes-for-Office-2016-for-Mac-ed2da564-6d53-4542-9954-7e3209681a41?ui=en-US&rs=en-US&ad=US");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.office.com/en-us/article/Release-notes-for-Office-2016-for-Mac-ed2da564-6d53-4542-9954-7e3209681a41?ui=en-US&rs=en-US&ad=US");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  exit(0);
}

include("version_func.inc");

offVer = "";

if(!offVer = get_kb_item("MS/Office/MacOSX/Ver")){
  exit(0);
}

if(offVer =~ "^(15\.)" && version_is_less(version:offVer, test_version:"15.41"))
{
  report = report_fixed_ver(installed_version:offVer, fixed_version:"15.41.0 (Build 17120500)");
  security_message(data:report);
  exit(0);
}
exit(0);
