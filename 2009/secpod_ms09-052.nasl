###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms09-052.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Microsoft Windows Media Player ASF Heap Overflow Vulnerability (974112)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow attackers to crash an affected player
  or execute arbitrary code on the affected application.
  Impact Level: Application";
tag_affected = "Microsoft Windows Media Player 6.4
  Microsoft Windows 2K  Service Pack 4 and prior.
  Microsoft Windows XP  Service Pack 3 and prior.
  Microsoft Windows 2K3 Service Pack 2 and prior.";
tag_insight = "A heap-based overflow error occurs while processing malformed ASF files,
  which can be exploited by tricking a user into opening a malformed ASF file
  or visiting a malicious web page.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link.
  http://www.microsoft.com/technet/security/bulletin/ms09-052.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS09-052.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900879");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-10-14 16:47:08 +0200 (Wed, 14 Oct 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-2527");
  script_bugtraq_id(36644);
  script_name("Microsoft Windows Media Player ASF Heap Overflow Vulnerability (974112)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/974112");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2888");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS09-052.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2k:5, win2003:3) <= 0){
  exit(0);
}

# MS09-052 Hotfix check
if(hotfix_missing(name:"974112") == 0){
  exit(0);
}

dllPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(!dllPath){
  exit(0);
}

share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",
                    string:dllPath + "\strmdll.dll");
dllVer = GetVer(file:file, share:share);
if(!dllVer){
  exit(0);
}

if(!isnull(dllVer))
{
  # Grep for strmdll.dll version < 4.1.0.3938
  if(version_is_less(version:dllVer, test_version:"4.1.0.3938")){
    security_message(0);
  }
}
