##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms08-053_900044.nasl 9349 2018-04-06 07:02:25Z cfischer $
# Description: Windows Media Encoder 9 Remote Code Execution Vulnerability (954156)
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
##############################################################################

tag_impact = "Remote attackers can execute arbitrary code, if a user views
        a specially crafted web page, and can successfully exploit to 
        take complete control of an affected system to view, change, or
        delete, or create new accounts with full user rights.
 Impact Level : Application/System";

tag_solution = "Run Windows Update and update the listed hotfixes or download and
 update mentioned hotfixes in the advisory from the below link,
 http://www.microsoft.com/technet/security/bulletin/ms08-053.mspx";

tag_affected = "Windows Media Encoder 9 on Windows 2K/XP/2003";

tag_insight = "The flaw is due to a boundary error in the WMEX.DLL ActiveX
        control.";


tag_summary = "This host is missing a critical security update according to
 Microsoft Bulletin MS08-053.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.900044");
 script_version("$Revision: 9349 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2008-09-10 17:51:23 +0200 (Wed, 10 Sep 2008)");
 script_bugtraq_id(31065);
 script_cve_id("CVE-2008-3008");
 script_copyright("Copyright (C) 2008 SecPod");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_category(ACT_GATHER_INFO);
 script_family("Windows : Microsoft Bulletins");
 script_name("Windows Media Encoder 9 Remote Code Execution Vulnerability (954156)");
 script_dependencies("secpod_reg_enum.nasl");
 script_require_ports(139, 445);
 script_mandatory_keys("SMB/WindowsVersion");

 script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms08-053.mspx");
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "affected" , value : tag_affected);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "impact" , value : tag_impact);
 script_tag(name:"qod_type", value:"registry");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}


 include("smb_nt.inc");
 include("secpod_reg.inc");
 include("version_func.inc");
 include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2k:5, win2003:3, win2008:2, winVista:2) <= 0){
	 exit(0);
 }
 
dllPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                                "\Uninstall\Windows Media Encoder 9",
                           item:"DisplayIcon");

dllPath = dllPath - "WMEnc.exe" + "wmex.dll";

if(!registry_key_exists(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                             "\Uninstall\Windows Media Encoder 9")){
        exit(0);
}

wmeName = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\Uninstall\Windows Media Encoder 9",
                          item:"DisplayName");

if("Windows Media Encoder 9" >< wmeName)
{
       
        if(hotfix_missing(name:"954156") == 0){
                exit(0);
        }

        vers = get_version(dllPath:dllPath);
        if(vers == NULL){
                exit(0);
        }

	    # Grep wmex.dll version < 9.0.0.3359
        if(ereg(pattern:"^9\.0?0\.0?0\.([0-2]?[0-9]?[0-9]?[0-9]|3[0-2][0-9]" +
			"[0-9]|33[0-4][0-9]|335[0-8])$", string:vers)){
                security_message(0);
	    }
}