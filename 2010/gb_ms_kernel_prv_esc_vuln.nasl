###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kernel_prv_esc_vuln.nasl 8510 2018-01-24 07:57:42Z teissa $
#
# Microsoft Windows #GP Trap Handler Privilege Escalation Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_impact = "Successful exploitation will allow remote attackers to bypass
certain security restrictions or can gain escalated privileges via specially
crafted attack.
Impact Level: System.";

tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
Microsoft Windows 2000 Service Pack 4 and prior.
Microsoft Windows Server 2003 Service Pack 2 and prior.";

tag_insight = "This issue is due to the kernel not properly handling certain
exceptions when setting up a VDM (Virtual DOS Machine) context, which
allows users to gain kernel privileges by setting up a crafted 'DM_TIB'
in their 'TEB' and reach the 'Ki386BiosCallReturnAddress()' function via
the '#GP trap handler (nt!KiTrap0D)'.";

tag_summary = "The host is installed with Microsoft Windows operating system and
is prone to Privilege Escalation Vulnerability.

This NVT has been replaced by NVT secpod_ms10-015.nasl
(OID:1.3.6.1.4.1.25623.1.0.900740).";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800442");
  script_version("$Revision: 8510 $");
  script_tag(name:"deprecated", value:TRUE);
  script_tag(name:"last_modification", value:"$Date: 2018-01-24 08:57:42 +0100 (Wed, 24 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-01-22 16:43:14 +0100 (Fri, 22 Jan 2010)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-0232");
  script_name("Microsoft Windows GP Trap Handler Privilege Escalation Vulnerability");

  script_xref(name : "URL" , value : "http://isc.sans.org/diary.html?storyid=8050");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0179");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/advisory/979682.mspx");
  script_xref(name : "URL" , value : "http://foro.elhacker.net/bugs_y_exploits/0day_m_iquestcve20100232-t281831.0.html");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

exit(66); ## This NVT is deprecated as addressed in secpod_ms10-015.nasl.

include("smb_nt.inc");
include("secpod_reg.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

if(hotfix_check_sp(xp:4, win2k:5, win2003:3) <= 0){
  exit(0);
}

# Checking For the workaround
dkey ="SOFTWARE\Policies\Microsoft\Windows\AppCompat";
if(registry_key_exists(key:dkey))
{

  dValue = registry_get_dword(key:dkey, item:"VDMDisallowed");
  if(dValue != "1")
  {
    security_message(0);
    exit(0);
  }
}
else
{
 security_message(0);
}
