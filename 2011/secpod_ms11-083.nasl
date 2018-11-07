###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-083.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Microsoft Windows TCP/IP Remote Code Execution Vulnerability (2588516)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902484");
  script_version("$Revision: 11997 $");
  script_cve_id("CVE-2011-2013");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-11-09 08:37:28 +0530 (Wed, 09 Nov 2011)");
  script_name("Microsoft Windows TCP/IP Remote Code Execution Vulnerability (2588516)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/46731");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2588516");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms11-083");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/registry_enumerated");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attacker to execute the arbitrary
  code in kernel mode. An attacker could then install programs, view, change,
  delete data or create new accounts with full user rights.");
  script_tag(name:"affected", value:"Microsoft Windows 7 Service Pack 1 and prior
  Microsoft Windows Vista Service Pack 2 and prior
  Microsoft Windows Server 2008 Service Pack 2 and prior");
  script_tag(name:"insight", value:"The flaw is due to an integer overflow error in the TCP/IP
  implementation when parsing UDP traffic and which can be exploited
  via a continuous flow of specially crafted UDP datagrams sent to a
  closed port.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory");
  script_tag(name:"summary", value:"This host is missing a critical security update according to
  Microsoft Bulletin MS11-083.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.microsoft.com/technet/security/bulletin/ms11-083.mspx");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win2008:3, win7:2) <= 0){
  exit(0);
}

## MS11-083 Hotfix (2588516)
if(hotfix_missing(name:"2588516") == 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

sysVer = fetch_file_version(sysPath:sysPath, file_name:"\system32\drivers\tcpip.sys");
if(!sysVer){
  exit(0);
}

if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if(!SP) {
    SP = get_kb_item("SMB/Win2008/ServicePack");
  }

  if("Service Pack 2" >< SP)
  {
    if(version_in_range(version:sysVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18518")||
       version_in_range(version:sysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22718")){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

else if(hotfix_check_sp(win7:2) > 0)
{
  if(version_in_range(version:sysVer, test_version:"6.1.7600.16000", test_version2:"6.1.7600.16888")||
     version_in_range(version:sysVer, test_version:"6.1.7600.20000", test_version2:"6.1.7600.21059")||
     version_in_range(version:sysVer, test_version:"6.1.7601.17000", test_version2:"6.1.7601.17696")||
     version_in_range(version:sysVer, test_version:"6.1.7601.21000", test_version2:"6.1.7601.21827")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
