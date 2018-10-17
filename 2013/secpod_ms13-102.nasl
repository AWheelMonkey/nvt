###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-102.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Microsoft Windows Local Procedure Call Local Privilege Escalation Vulnerability (2898715)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903416");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-3878");
  script_bugtraq_id(64088);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-12-11 08:19:14 +0530 (Wed, 11 Dec 2013)");
  script_name("Microsoft Windows Local Procedure Call Local Privilege Escalation Vulnerability (2898715)");


  script_tag(name:"summary", value:"This host is missing an important security update according to Microsoft
Bulletin MS13-102.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
install the hotfixes from the referenced advisory.");
  script_tag(name:"insight", value:"The flaw is due to an unspecified error within the LRPC client and
can be exploited to cause a stack-based buffer overflow by sending
a specially crafted LPC (Local Procedure Call) port message via a
customised LRPC server.");
  script_tag(name:"affected", value:"Microsoft Windows XP Service Pack 3 and prior
Microsoft Windows XP x64 Edition Service Pack 2 and prior
Microsoft Windows 2003 x32/x64 Service Pack 2 and prior ");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code and
take complete control of an affected system.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/55988/");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2898715");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-102");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms13-102");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

sysVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Rpcrt4.dll");
if(!sysVer){
  exit(0);
}

if(hotfix_check_sp(xp:4) > 0)
{
  if(version_is_less(version:sysVer, test_version:"5.1.2600.6477")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win2003:3, xpx64:3, win2003x64:3) > 0)
{
  if(version_is_less(version:sysVer, test_version:"5.2.3790.5254")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
