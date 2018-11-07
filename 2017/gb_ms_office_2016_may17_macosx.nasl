###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_2016_may17_macosx.nasl 11989 2018-10-19 11:25:26Z cfischer $
#
# Microsoft Office 2016 Memory Corruption Vulnerability (Mac OS X)
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

CPE = "cpe:/a:microsoft:office";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811048");
  script_version("$Revision: 11989 $");
  script_cve_id("CVE-2017-0254");
  script_bugtraq_id(98101);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 13:25:26 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-19 15:20:17 +0530 (Fri, 19 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office 2016 Memory Corruption Vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update for Microsoft Office 2016 on Mac OSX according to Microsoft security
  update May 2017");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to error when the
  software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2016 on Mac OS X");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.office.com/en-us/article/Release-notes-for-Office-2016-for-Mac-ed2da564-6d53-4542-9954-7e3209681a41");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  script_xref(name:"URL", value:"https://support.office.com/en-us/article/Release-notes-for-Office-2016-for-Mac-ed2da564-6d53-4542-9954-7e3209681a41");
  exit(0);
}

include("version_func.inc");

if(!offVer = get_kb_item("MS/Office/MacOSX/Ver")){
  exit(0);
}

if(offVer =~ "^(15\.)" && version_is_less(version:offVer, test_version:"15.34.0"))
{
  report = 'File version:     ' + offVer   + '\n' +
           'Vulnerable range: 15.0 - 15.33.0' + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
