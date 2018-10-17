###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011069.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft PowerPoint 2013 Service Pack 1 Remote Code Execution Vulnerability (KB4011069)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811661");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-8742");
  script_bugtraq_id(100741);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-13 08:40:06 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft PowerPoint 2013 Service Pack 1 Remote Code Execution Vulnerability (KB4011069)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011069");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the software fails to
  properly handle objects in memory. ");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft PowerPoint 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011069");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/PowerPnt/Version", "MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

pptVer = get_kb_item("SMB/Office/PowerPnt/Version");
if(!pptVer){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"ProgramFilesDir");
if(!path){
  exit(0);
}

## Office Path
offPath = path + "\Microsoft Office\OFFICE15" ;

exeVer  = fetch_file_version(sysPath:offPath, file_name:"ppcore.dll");
if(!exeVer){
  exit(0);
}

if(exeVer =~ "^15\." && version_is_less(version:exeVer, test_version:"15.0.4963.1000"))
{
  report = 'File checked:     ' + offPath + "\ppcore.dll"  + '\n' +
           'File version:     ' + exeVer  + '\n' +
           'Vulnerable range: ' + "15.0 - 15.0.4963.0999" + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
