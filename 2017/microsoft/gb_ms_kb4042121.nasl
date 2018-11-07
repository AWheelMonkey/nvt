###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4042121.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Windows GDI Information Disclosure Vulnerability (KB4042121)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811859");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-11816");
  script_bugtraq_id(101094);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-10-11 09:51:23 +0530 (Wed, 11 Oct 2017)");
  script_name("Windows GDI Information Disclosure Vulnerability (KB4042121)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4042121");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the way that the
  Windows Graphics Device Interface (GDI) handles objects in memory, allowing
  an attacker to retrieve information from a targeted system.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to retrieve information from a targeted system. By itself,
  the information disclosure does not allow arbitrary code execution. However,
  it could allow arbitrary code to be run if the attacker uses it in combination
  with another vulnerability.");

  script_tag(name:"affected", value:"Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4042121");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2008:3, win2008x64:3) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

fileVer = fetch_file_version(sysPath:sysPath, file_name:"gdi32.dll");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"6.0.6002.24200"))
{
  report = 'File checked:     ' + sysPath + "\gdi32.dll" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range: Less than 6.0.6002.24200\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
