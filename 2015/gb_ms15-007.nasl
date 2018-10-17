###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-007.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Windows Network Policy Server Denial-of-Service Vulnerability (3014029)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805241");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-0015");
  script_bugtraq_id(71933);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-01-14 11:08:22 +0530 (Wed, 14 Jan 2015)");
  script_name("Microsoft Windows Network Policy Server Denial-of-Service Vulnerability (3014029)");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-007.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an error within the
  RADIUS implementation related to Internet Authentication Service (IAS) and
  Network Policy Server (NPS).");

  script_tag(name:"impact", value:"Successful exploitation could allow remote
  attackers to cause a DoS (Denial of Service).");

  script_tag(name:"affected", value:"Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2012/R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://secunia.com/advisories/62148");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3014029");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-007");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win2003:3, win2003x64:3, win2008:3, win2008r2:2,
                   win2012:1, win2012R2:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Iassam.dll");
if(!dllVer){
  exit(0);
}

if(hotfix_check_sp(win2003x64:3,win2003:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"5.2.3790.5513")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Currently not supporting for Windows Server 2008 64 bit
if(hotfix_check_sp(win2008:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19250")||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23556")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}


if(hotfix_check_sp(win2008r2:2) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18685")||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22892")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17199")||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21315")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

##win2012R2
if(hotfix_check_sp(win2012R2:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17549")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
