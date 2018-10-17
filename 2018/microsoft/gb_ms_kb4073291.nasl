###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4073291.nasl 10918 2018-08-10 17:32:46Z cfischer $
#
# Microsoft Windows Speculative Execution Side-Channel Vulnerabilities (KB4073291)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812740");
  script_version("$Revision: 10918 $");
  script_cve_id("CVE-2017-5753", "CVE-2017-5715", "CVE-2017-5754");
  script_bugtraq_id(102371, 102378, 102376);
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:32:46 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-01-22 12:24:05 +0530 (Mon, 22 Jan 2018)");
  script_name("Microsoft Windows Speculative Execution Side-Channel Vulnerabilities (KB4073291)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4073291.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple errors leading to 'speculative execution
  side-channel attacks' that affect many modern processors and operating systems
  including Intel, AMD, and ARM.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to read the content of memory across a trusted boundary and can therefore lead
  to information disclosure.

  Impact Level: System");

  script_tag(name:"affected", value:"Windows 10 Version 1709 for 32-bit Systems.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4073291");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4073291");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

sysPath = "";
edgeVer = "";

if(hotfix_check_sp(win10:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

exeVer = fetch_file_version(sysPath, file_name:"Ntoskrnl.exe");
if(!exeVer){
  exit(0);
}

if(version_in_range(version:exeVer, test_version:"10.0.16299.0", test_version2:"10.0.16299.200"))
{
  report = 'File checked:     ' + sysPath + "\Ntoskrnl.exe" + '\n' +
           'File version:     ' + exeVer  + '\n' +
           'Vulnerable range: 10.0.16299.0 - 10.0.16299.200\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
