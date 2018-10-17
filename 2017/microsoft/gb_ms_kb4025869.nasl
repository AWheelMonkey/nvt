###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4025869.nasl 10967 2018-08-15 05:53:29Z cfischer $
#
# Microsoft Live Meeting 2007 Add-in Multiple Vulnerabilities (KB4025869)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811765");
  script_version("$Revision: 10967 $");
  script_cve_id("CVE-2017-8676", "CVE-2017-8696", "CVE-2017-8695");
  script_bugtraq_id(100755, 100780, 100773);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 07:53:29 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-09-14 15:14:00 +0530 (Thu, 14 Sep 2017)");
  script_name("Microsoft Live Meeting 2007 Add-in Multiple Vulnerabilities (KB4025869)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4025869");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - An error in the way that the Windows Graphics Device Interface (GDI) handles
    objects in memory.

  - When Windows Uniscribe improperly discloses the contents of its memory.

  - The way Windows Uniscribe handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to potentially sensitive information and take complete control
  of system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Live Meeting 2007 Add-in");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4025869");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4025869");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/Office/Outlook/Version");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

if(!path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir")){
  exit(0);
}

filepath = path + "\Microsoft Office\Live Meeting 8\Addins";

## fetch version
if(!liveVer = fetch_file_version(sysPath:filepath, file_name:"lmaddins.dll")){
  exit(0);
}

if(version_is_less(version:liveVer, test_version:"8.0.6362.281"))
{
  report = 'File checked:     ' +  filepath + "\lmaddins.dll\n" +
           'File version:     ' +  liveVer  + '\n' +
           'Vulnerable range: Less than 8.0.6362.281\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
