###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer_kb3203427.nasl 11919 2018-10-16 09:49:19Z mmartin $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerability (KB3203427)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810944");
  script_version("$Revision: 11919 $");
  script_cve_id("CVE-2017-0283");
  script_bugtraq_id(98920);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 11:49:19 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 12:38:50 +0530 (Wed, 14 Jun 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerability (KB3203427)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB3203427.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the way Windows Uniscribe
  handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to take control of the affected system. An attacker could then install
  programs; view, change, or delete data; or create new accounts with full user
  rights. Users whose accounts are configured to have fewer user rights on the
  system could be less impacted than users who operate with administrative user
  rights.");

  script_tag(name:"affected", value:"Microsoft Word Viewer");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3203427");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(!wordviewVer){
  exit(0);
}

wordviewPath = get_kb_item("SMB/Office/WordView/Install/Path");
if(!wordviewPath){
  wordviewPath = "Unable to fetch the install path";
}

offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"CommonFilesDir");
if(offPath)
{
  offPath += "\Microsoft Shared\OFFICE11";
  dllVer = fetch_file_version(sysPath:offPath, file_name:"usp10.dll");
  if(dllVer)
  {
    if(version_is_less(version:dllVer, test_version:"1.0626.6002.24099"))
    {
      report = 'File checked:     ' + offPath + "Usp10.dll" + '\n' +
               'File version:     ' + dllVer + '\n' +
               'Vulnerable range: Less than 1.0626.6002.24099 \n' ;
      security_message(data:report);
      exit(0);
    }
  }
}
exit(0);
