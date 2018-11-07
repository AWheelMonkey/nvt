###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_kb3203393.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# Microsoft Office Word Multiple Remote Code Execution Vulnerabilities (3203393)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810912");
  script_version("$Revision: 11982 $");
  script_cve_id("CVE-2017-0292", "CVE-2017-8509");
  script_bugtraq_id(98836, 98812);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 10:12:53 +0530 (Wed, 14 Jun 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Multiple Remote Code Execution Vulnerabilities (3203393)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3203393.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An error in the Office software which fails to properly handle objects in
    memory.

  - An error when Windows and Microsoft Word fails to properly parse PDF files.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary code in the context of the current user and perform other
  actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Word 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3203393");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("version_func.inc");

exeVer = get_kb_item("SMB/Office/Word/Version");
if(!exeVer){
  exit(0);
}

exePath = get_kb_item("SMB/Office/Word/Install/Path");
if(!exePath){
  exePath = "Unable to fetch the install path";
}

if(exeVer =~ "^(15\.)" && version_is_less(version:exeVer, test_version:"15.0.4937.1000"))
{
  report = 'File checked:     ' + exePath + "winword.exe"  + '\n' +
           'File version:     ' + exeVer  + '\n' +
           'Vulnerable range: ' + '15 - 15.0.4937.999' + '\n' ;
  security_message(data:report);
  exit(0);
}
