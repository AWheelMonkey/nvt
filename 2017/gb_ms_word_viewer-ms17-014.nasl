###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer-ms17-014.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerability (4013241)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810710");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-0053");
  script_bugtraq_id(96745);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-15 13:54:25 +0530 (Wed, 15 Mar 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerability (4013241)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS17-014");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists as Office software
  fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Word Viewer 2007");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3178694");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms17-014");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
wordviewPath = get_kb_item("SMB/Office/WordView/Install/Path");
if(!wordviewPath){
  wordviewPath = "Unable to fetch the install path";
}

if(wordviewVer)
{
  if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8439"))
  {
    report = 'File checked:     ' + wordviewPath + "Wordview.exe" + '\n' +
             'File version:     ' + wordviewVer  + '\n' +
             'Vulnerable range: 11.0 - 11.0.8439 \n' ;
    security_message(data:report);
    exit(0);
  }
}